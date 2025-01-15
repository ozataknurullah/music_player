import 'package:flutter/material.dart';
import 'package:music_player/core/constans/colors.dart';

class AppFonts {
  static const TextStyle title = TextStyle(
    fontSize: 36,
    color: AppColors.textPrimary,
    fontFamily: 'Poppins',
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    color: AppColors.textPrimary,
    fontFamily: 'Poppins',
  );

  static const TextStyle splashText = TextStyle(
    fontSize: 13,
    color: AppColors.splashText,
    fontFamily: 'Inter',
  );

  static const TextStyle secondaryText = TextStyle(
    fontSize: 13,
    color: AppColors.splashText,
    fontFamily: 'Inter',
    fontStyle: FontStyle.normal,
  );

  static const TextStyle categoryPrimaryText = TextStyle(
    fontSize: 13,
    color: AppColors.textPrimary,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );

  static const TextStyle categorySecondaryText = TextStyle(
    fontSize: 13,
    color: AppColors.unselectedText,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );
}
