import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_1/home.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class Lottiee extends StatelessWidget {
  const Lottiee({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'File/loading.json', 
                height: 100,
              ),
            ],
          ),
        ),
      ),
      nextScreen: CurrencyConvert(),
      splashIconSize: 100,
      duration: 2800,
      pageTransitionType: PageTransitionType.fade, 
      backgroundColor: Color.fromRGBO(77, 77, 77, 1),
    );
  }
}
