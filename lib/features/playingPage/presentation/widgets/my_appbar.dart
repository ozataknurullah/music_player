import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_player/core/constans/colors.dart';
import 'package:music_player/core/constans/fonts.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
  });

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(4),
            child: SvgPicture.asset(
              'assets/icons/Vector.svg',
              height: 12,
              width: 12,
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
