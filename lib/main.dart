import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:e_commarce_app/Home%20page/home.dart';
import 'package:e_commarce_app/sign%20in/Sign%20in.dart';
import 'package:e_commarce_app/sign%20in/login_check.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class SpleshScreen extends StatelessWidget {
  const SpleshScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.fitWidth,
          )
        ],
      ),
      backgroundColor: Colors.white,
      nextScreen: userfind(),
      splashIconSize: 400,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
