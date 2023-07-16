//ignore_for_file: unnecessary_const

import 'package:e_commarce_app/Home%20page/home.dart';
import 'package:e_commarce_app/models/widgets.dart';
import 'package:e_commarce_app/sign%20in/auth_service.dart';
import 'package:e_commarce_app/sign%20in/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formKey = GlobalKey<FormState>();
  late bool _isloading = false;
  String email = "";
  String password = "";
  String fullName = "";
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _isloading
            ? Center(
                child: CircularProgressIndicator(
                color: Colors.black,
              ))
            : SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 4,
                      child: Image.asset(
                        'assets/images/logo2.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 1.4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            30, 7, 00, 20),
                                        child: Text(
                                          'Sign-up',
                                          style: GoogleFonts.playfairDisplay(
                                              fontSize: 30,
                                              fontWeight: FontWeight.w900),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            30, 00, 30, 00),
                                        child: Text('Name',
                                            style: GoogleFonts.nunito(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 00, 30, 00),
                                    child: TextFormField(
                                      onChanged: (val) {
                                        setState(() {
                                          fullName = val;
                                        });
                                      },
                                      validator: (val) {
                                        if (val!.isNotEmpty) {
                                          return null;
                                        } else {
                                          return "Name cannot be empty";
                                        }
                                      },
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        hintText: ('Your name'),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        hintStyle: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            30, 10, 30, 00),
                                        child: Text('Email',
                                            style: GoogleFonts.nunito(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 00, 30, 00),
                                    child: TextFormField(
                                      onChanged: (val) {
                                        setState(() {
                                          email = val;
                                        });
                                      },
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        hintText: ('Your email-id'),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        hintStyle: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                      validator: (val) {
                                        return RegExp(
                                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                .hasMatch(val!)
                                            ? null
                                            : "Please enter a valid email";
                                      },
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            30, 10, 30, 00),
                                        child: Text('Password',
                                            style: GoogleFonts.nunito(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        30, 00, 30, 00),
                                    child: TextFormField(
                                      obscureText: true,
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
                                      decoration: const InputDecoration(
                                        border: UnderlineInputBorder(),
                                        hintText: ('Your Password'),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        hintStyle: TextStyle(
                                            color: Colors.black, fontSize: 15),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child: InkWell(
                                      onTap: () {
                                        register();
                                      },
                                      child: Container(
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width -
                                                80,
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Register',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.black),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25)),
                      ),
                    ),
                  ],
                ),
              ));
  }

  register() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        _isloading = true;
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Home()));
      });
      await authService
          .registerUserWithEmailandPassword(fullName, email, password)
          .then((value) async {
        if (value == true) {
          // saving the shared preference state
          await HelperFunctions.saveUserLoggedInStatus(true);
          await HelperFunctions.saveUserEmailSF(email);
          await HelperFunctions.saveUserNameSF(fullName);
        } else {
          showSnackbar(context, Colors.red, value);
        }
      });
    }
  }
}
