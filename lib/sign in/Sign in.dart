// ignore_for_file: unnecessary_const

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commarce_app/Home%20page/home.dart';
import 'package:e_commarce_app/Home%20page/recenthome.dart';
import 'package:e_commarce_app/models/widgets.dart';
import 'package:e_commarce_app/sign%20in/auth_service.dart';
import 'package:e_commarce_app/sign%20in/database_service.dart';
import 'package:e_commarce_app/sign%20in/forgot%20password.dart';
import 'package:e_commarce_app/sign%20in/helper_function.dart';
import 'package:e_commarce_app/sign%20in/phoneAuthScreen.dart';
import 'package:e_commarce_app/sign%20in/sign%20up.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

User? user = FirebaseAuth.instance.currentUser;

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);
  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  bool _isLoading = false;
  AuthService authService = AuthService();

  Future<User?> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final FirebaseAuth auth = FirebaseAuth.instance;

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);
        user = userCredential.user;
        print("Google SignIn ~~>> ${user.toString()}");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          print(e.code);
        } else if (e.code == 'invalid-credential') {
          print(e.code);
        }
      } catch (e) {
        print(e.toString());
      }
    } else {
      print("Google SignIn 123~~>> ${user.toString()}");
    }
    return user;
  }

  login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      await authService
          .loginWithUserNameandPassword(email, password)
          .then((value) async {
        if (value == true) {
          QuerySnapshot snapshot =
              await DatabaseService(uid: FirebaseAuth.instance.currentUser!.uid)
                  .gettingUserData(email);
          // saving the values to our shared preferences
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserNameSF(snapshot.docs[0]['fullName']);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Home()));
        } else {
          showSnackbar(context, Colors.red, value);
          setState(() {
            _isLoading = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 4,
            child: Image.asset('assets/images/logo2.jpg', fit: BoxFit.fill),
          ),
          Form(
            key: formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 00, 20),
                    child: Text(
                      'Log-in',
                      style: GoogleFonts.playfairDisplay(
                          fontSize: 30, fontWeight: FontWeight.w900),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 00, 30, 00),
                    child: Text('Email',
                        style: GoogleFonts.nunito(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 00, 30, 00),
                child: TextFormField(
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },

                  // check tha validation
                  validator: (val) {
                    return RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val!)
                        ? null
                        : "Please enter a valid email";
                  },

                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: ('Your Email id'),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintStyle: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 30, 00),
                    child: Text('Password',
                        style: GoogleFonts.nunito(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 00, 30, 00),
                child: TextFormField(
                  validator: (val) {
                    if (val!.length < 6) {
                      return "Password must be at least 6 characters";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: ('Your Password'),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintStyle: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(00, 10, 30, 10),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const forgotpass()));
                        },
                        child: Text('Forgot password?',
                            style: GoogleFonts.nunito(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey))),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  login();
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 80,
                  alignment: Alignment.center,
                  child: Text(
                    'Log in',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(00, 15, 00, 00),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account ? ",
                        style: GoogleFonts.nunito(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey)),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Signup(),
                              ));
                        },
                        child: const Text(
                          'Sign-Up',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: Row(children: <Widget>[
                  const Expanded(
                      child: Divider(
                    thickness: 2,
                  )),
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text("Or login with",
                        style: const TextStyle(fontSize: 15)),
                  ),
                  const Expanded(
                      child: Divider(
                    thickness: 2,
                  )),
                ]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                      maxRadius: 30,
                      backgroundColor: Colors.grey,
                      child: InkWell(
                        onTap: () {
                          signInWithGoogle();
                        },
                        child: Icon(
                          Icons.email_rounded,
                          size: 40,
                          color: Colors.black,
                        ),
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                      maxRadius: 30,
                      backgroundColor: Colors.grey,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignInWithPhonenumber()));
                        },
                        child: Icon(
                          Icons.phone,
                          size: 40,
                          color: Colors.black,
                        ),
                      ))
                ],
              )
            ]),
          ),
        ]),
      ),
      backgroundColor: Colors.white,
    );
  }
}
