import 'package:e_commarce_app/Home%20page/home.dart';
import 'package:e_commarce_app/sign%20in/Sign%20in.dart';
import 'package:e_commarce_app/sign%20in/helper_function.dart';
import 'package:flutter/material.dart';

class userfind extends StatefulWidget {
  const userfind({Key? key}) : super(key: key);

  @override
  State<userfind> createState() => _userfindState();
}

class _userfindState extends State<userfind> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isSignedIn ? Home() : Signin();
  }
}
