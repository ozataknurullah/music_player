import 'dart:async';

import 'package:flutter/material.dart';
import 'package:music_player/core/constans/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _scale = 0.9;

  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      setState(() {
        _scale = 1.3;
      });
    });
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushNamed(context, '/onboardingPage'),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedScale(
              scale: _scale,
              curve: Curves.easeInOut,
              duration: Duration(seconds: 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 100,
                ),
              ),
            ), //the app logo
            SizedBox(
              height: 20,
            ),
          ],
        )));
  }
}
