import 'package:flutter/material.dart';
import 'package:music_player/features/discoverPage/presentation/discover_screen.dart';
import 'package:music_player/features/homePage/presentation/home_screen.dart';
import 'package:music_player/features/onboardingPage/presentation/onboarding_screen.dart';
import 'package:music_player/features/splashPage/presentation/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PODKES',
      home: SplashScreen(),
      routes: {
        '/homePage': (context) => const HomeScreen(),
        '/onboardingPage': (context) => const OnboardingScreen(),
      },
    );
  }
}
