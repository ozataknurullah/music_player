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
    final resposive = ResponsiveHelper(context);
    return AppBar(
      elevation: 0,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(resposive.h(15)),
          child: SvgPicture.asset(
            'assets/icons/Menu.svg',
            height: resposive.h(24),
            width: resposive.h(24),
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
              margin: EdgeInsets.all(resposive.h(15)),
              child: SvgPicture.asset(
                'assets/icons/Notification.svg',
                height: resposive.h(24),
                width: resposive.h(24),
              )),
        )
      ],
      backgroundColor: AppColors.primary,
      centerTitle: true,
      title: Text(
        'Podkes',
        style: AppFonts.subtitle,
      ),
    );
  }
}
