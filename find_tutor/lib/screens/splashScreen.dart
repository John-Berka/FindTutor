import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:find_tutor/screens/getStarted.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class splasscreen extends StatefulWidget {
  const splasscreen({Key? key}) : super(key: key);

  @override
  State<splasscreen> createState() => _splasscreenState();
}

class _splasscreenState extends State<splasscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        centered: true,
        splashTransition: SplashTransition.fadeTransition,
        duration: 2500,
        backgroundColor: Color(0xff8884FF),
        splash: Container(
          child: Text(
            "FindTutor",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),
          ),
        ),
        nextScreen: getStarted(),
      ),
    );
  }
}
