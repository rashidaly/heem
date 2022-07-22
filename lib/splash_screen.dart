import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'Pages/wrapper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Lottie.asset('assets/images/97886-circle-animation.json'),
        backgroundColor: Colors.black,
        nextScreen: const Wrapper(),
        splashIconSize: 250,
        duration: 3000,
        //splashTransition: SplashTransition.fadeTransition,
        // pageTransitionType: pageTransitionType,
        animationDuration: const Duration(seconds: 1),
      ),
    );
  }
}
