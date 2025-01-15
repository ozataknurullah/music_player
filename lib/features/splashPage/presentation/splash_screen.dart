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

  @override
  void initState() {
    super.initState();

    /// animation of the splash screen
    Timer(Duration(milliseconds: 300), () {
      setState(() {
        _scale = 1.2;
      });
    });

    /// Continue after the animation
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushNamed(context, '/onboardingPage'),
    );
  }

  @override
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
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
