import 'package:flutter/material.dart';
import 'package:music_player/core/constans/colors.dart';
import 'package:music_player/core/constans/fonts.dart';
import 'package:music_player/core/helpers/responsive_helper.dart';

class MySearchField extends StatelessWidget {
  const MySearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveHelper(context);
    return Container(
      margin: EdgeInsets.only(
          top: responsive.h(20),
          left: responsive.w(20),
          right: responsive.w(20)),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.secondary,
          contentPadding: EdgeInsets.all(responsive.h(15)),
          hintText: 'Search',
          hintStyle: AppFonts.secondaryText,
          suffixIcon: Icon(Icons.search),
          suffixIconColor: AppColors.textSecondary,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(responsive.h(12)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
