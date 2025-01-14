import 'package:flutter/material.dart';
import 'package:music_player/core/constans/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
          child: Text(
        "Home Page",
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
