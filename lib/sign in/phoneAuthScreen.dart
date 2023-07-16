import 'dart:async';
import 'package:e_commarce_app/Home%20page/home.dart';
import 'package:e_commarce_app/Home%20page/recenthome.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../pop up/toast.dart';

class SignInWithPhonenumber extends StatefulWidget {
  const SignInWithPhonenumber({Key? key}) : super(key: key);

  @override
  _SignInWithPhonenumberState createState() => _SignInWithPhonenumberState();
}

class _SignInWithPhonenumberState extends State<SignInWithPhonenumber> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String verification = '';
  final _formKey = GlobalKey<FormState>();
  String? phoneNumber;
  TextEditingController otpEditingController = TextEditingController();
  String? _verificationId;
  int? forceResendingToken;
  bool showOtpScreen = false;
  late StreamController<ErrorAnimationType> errorController;
  bool loading = false;

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();
    super.dispose();
  }

  void verifyPhoneNumber() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      PhoneVerificationCompleted verificationCompleted =
          (PhoneAuthCredential phoneAuthCredential) async {
        User? user;
        bool error = false;
        try {
          user = (await firebaseAuth.signInWithCredential(phoneAuthCredential))
              .user!;
        } catch (e) {
          print("Failed to sign in: " + e.toString());
          error = true;
        }
        if (!error && user != null) {
          String id = user.uid;
          //here you can store user data in backend
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Home()));
        }
      };

      PhoneVerificationFailed verificationFailed =
          (FirebaseAuthException authException) {
        showToast(authException.message!);
      };
      PhoneCodeSent codeSent =
          (String? verificationId, [int? forceResendingToken]) async {
        showToast('Please check your phone for the verification code.');
        this.forceResendingToken = forceResendingToken;
        _verificationId = verificationId;
      };
      PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
          (String verificationId) {
        _verificationId = verificationId;
      };
      try {
        await firebaseAuth.verifyPhoneNumber(
            phoneNumber: phoneNumber!,
            timeout: const Duration(seconds: 5),
            forceResendingToken:
                forceResendingToken != null ? forceResendingToken : null,
            verificationCompleted: verificationCompleted,
            verificationFailed: verificationFailed,
            codeSent: codeSent,
            codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
        showOtpScreen = true;
      } catch (e) {
        showToast("Failed to Verify Phone Number: $e");
        showOtpScreen = false;
      }
      setState(() {
        loading = false;
      });
    }
  }

  void signInWithPhoneNumber() async {
    bool error = false;
    User? user;
    AuthCredential credential;
    setState(() {
      loading = true;
    });
    try {
      credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: otpEditingController.text,
      );
      user = (await firebaseAuth.signInWithCredential(credential)).user!;
    } catch (e) {
      showToast("Failed to sign in: " + e.toString());
      error = true;
    }
    if (!error && user != null && user.uid != null) {
      String id = user.uid;
      //here you can store user data in backend
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Home()));
    }
    setState(() {
      loading = false;
    });
  }

  Padding signInScreen() {
    return Padding(
      padding: EdgeInsets.fromLTRB(25, 00, 25, 20),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 4,
                        child: Image.asset('assets/images/logo2.jpg',
                            fit: BoxFit.fill),
                      ),
                    ],
                  ),
                  Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 00, 20),
                    child: Text(
                      'Sign-in',
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
                    child: Text("Hello,\nEnter your number\nbecome login.",
                        style: GoogleFonts.nunito(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(6.0),
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                ),
                child: InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    phoneNumber = number.phoneNumber;
                  },
                  onInputValidated: (bool value) {
                    print(value);
                  },
                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  ),
                  spaceBetweenSelectorAndTextField: 0,
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: TextStyle(color: Colors.black),
                  initialValue: PhoneNumber(isoCode: 'IN'),
                  formatInput: false,
                  keyboardType: TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  inputBorder: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: GestureDetector(
                  onTap: () => verifyPhoneNumber(),
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 80,
                    alignment: Alignment.center,
                    child: Text(
                      'GET OTP',
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding otpScreen() {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Verification',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15.0,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "You'll receive an OTP on",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 22.0,
                letterSpacing: 1.05,
              ),
            ),
            Text.rich(
              TextSpan(
                  text: 'number : ',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0,
                  ),
                  children: [
                    TextSpan(
                      text: phoneNumber,
                      style: TextStyle(color: Colors.black),
                    ),
                  ]),
            ),
            SizedBox(
              height: 30,
            ),
            AbsorbPointer(
              child: PinCodeTextField(
                appContext: context,
                length: 6,
                obscureText: false,
                hintCharacter: '0',
                hintStyle: TextStyle(
                  color: const Color(0x36000000),
                ),
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  borderWidth: 0,
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  activeColor: Colors.white,
                ),
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: true,
                errorAnimationController: errorController,
                controller: otpEditingController,
                onCompleted: (v) {
                  print("Completed");
                },
                onChanged: (value) {
                  print(value);
                },
                beforeTextPaste: (text) {
                  print("Allowing to paste $text");
                  return true;
                },
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () => verifyPhoneNumber(),
                child: Container(
                  child: Text(
                    'Code not received?',
                    style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 0.688,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 16 / 12),
              physics: NeverScrollableScrollPhysics(),
              itemCount: 9,
              itemBuilder: (context, index) {
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    otpEditingController.text += (index + 1).toString();
                    otpEditingController.selection = TextSelection.fromPosition(
                        TextPosition(offset: otpEditingController.text.length));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      (index + 1).toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
            GridView(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 16 / 12),
              physics: NeverScrollableScrollPhysics(),
              children: [
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    if (otpEditingController.text.length >= 1)
                      otpEditingController.text = otpEditingController.text
                          .substring(0, otpEditingController.text.length - 1);
                    otpEditingController.selection = TextSelection.fromPosition(
                        TextPosition(offset: otpEditingController.text.length));
                  },
                  child: Container(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.backspace_outlined,
                        color: Colors.black,
                      )),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    otpEditingController.text += 0.toString();
                    otpEditingController.selection = TextSelection.fromPosition(
                        TextPosition(offset: otpEditingController.text.length));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      '0',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    if (otpEditingController.text.length == 6) {
                      signInWithPhoneNumber();
                    } else if (otpEditingController.text.length < 6) {
                      showToast("Enter complete otp");
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "OK",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          showOtpScreen ? otpScreen() : signInScreen(),
          loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(),
        ],
      ),
    );
  }
}
