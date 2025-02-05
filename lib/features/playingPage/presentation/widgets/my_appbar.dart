import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_player/core/constans/colors.dart';
import 'package:music_player/core/constans/fonts.dart';
import 'package:music_player/core/helpers/responsive_helper.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
  });

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveHelper(context);
    return Padding(
      padding: EdgeInsets.all(responsive.w(15)),
      child: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.all(responsive.w(3)),
            child: SvgPicture.asset(
              'assets/icons/Vector.svg',
              height: responsive.h(12),
              width: responsive.w(12),
            ),
          ),
        ),
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text(
          'Now Playing',
          style: AppFonts.interMedium16,
        ),
      ),
    );
  }
}
