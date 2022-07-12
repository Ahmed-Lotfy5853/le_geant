import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'mainscreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Image.asset('assets/Logo.png'),
        nextScreen: MainScreen(),
    duration: 1000,
    splashIconSize: 250,
    backgroundColor: Colors.black.withOpacity(0.9),);
  }
}