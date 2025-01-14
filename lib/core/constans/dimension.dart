import 'package:flutter/material.dart';

class Dimensions {
  static double screenHeight = 0;
  static double screenWidth = 0;

  static void init(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
  }

  static double getHeight(double inputHeight) {
    return (inputHeight / 812.0) * screenHeight;
  }

  static double getWidth(double inputWidth) {
    return (inputWidth / 375.0) * screenWidth;
  }
}
