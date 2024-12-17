import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socialmedia/screen/LandingPage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return AnimatedSplashScreen(
        splash: Lottie.asset('assets/splashscreen/splash.json'),
        nextScreen: LandingPage(),
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      curve: Curves.easeOut,
      animationDuration: const Duration(seconds: 1)
    );
  }
}
