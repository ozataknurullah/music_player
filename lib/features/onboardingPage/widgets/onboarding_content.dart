import 'package:flutter/material.dart';
import 'package:music_player/core/constans/fonts.dart';
import 'package:music_player/core/helpers/responsive_helper.dart';

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.image,
    required this.title,
    required this.text,
  });

  final String image, title, text;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveHelper(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsive.w(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(responsive.w(100)),
              topRight: Radius.circular(responsive.w(100)),
            ),
            child: Image.asset(
              image,
              height: responsive.h(317),
              width: responsive.w(240),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: responsive.h(20),
          ),

          // PODKES heading
          Text(
            title,
            style: AppFonts.title,
          ),
          SizedBox(
            height: responsive.h(20),
          ),
          // detail text
          Text(
            text,
            style: AppFonts.splashText,
          ),
        ],
      ),
    );
  }
}
