import 'package:flutter/material.dart';
import 'package:music_player/features/splashscreen/presentation/splash_screen.dart';

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
        home: SplashScreen());
  }
}
