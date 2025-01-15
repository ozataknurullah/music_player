import 'package:flutter/material.dart';
import 'package:music_player/core/helpers/responsive_helper.dart';

import '../../../core/constans/colors.dart';

class AnimatedDot extends StatelessWidget {
  const AnimatedDot({
    super.key,
    required this.isActive,
  });
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveHelper(context);
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: responsive.h(6),
      width: isActive ? responsive.w(24) : responsive.w(6),
      decoration: BoxDecoration(
          color: isActive ? AppColors.accent : AppColors.textPrimary,
          borderRadius: BorderRadius.circular(responsive.w(12))),
    );
  }
}
