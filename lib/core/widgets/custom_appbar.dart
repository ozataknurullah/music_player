import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_player/core/constans/colors.dart';
import 'package:music_player/core/constans/fonts.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? leadingIconPath;
  final Color? leadingIconColor;
  final VoidCallback? onLeadingTap;
  final String? actionIconPath;
  final VoidCallback? onActionTap;
  final Color? actionIconColor;
  final Color? backgroundColor;
  final TextStyle? titleStyle;

  const MyAppBar({
    super.key,
    required this.title,
    this.leadingIconPath,
    this.onLeadingTap,
    this.actionIconPath,
    this.onActionTap,
    this.backgroundColor,
    this.titleStyle,
    this.leadingIconColor,
    this.actionIconColor,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: leadingIconPath != null
          ? GestureDetector(
              onTap: onLeadingTap,
              child: Container(
                margin: const EdgeInsets.all(15),
                child: SvgPicture.asset(
                  leadingIconPath!,
                  height: 24,
                  width: 24,
                  color: null,
                ),
              ),
            )
          : null,
      actions: actionIconPath != null
          ? [
              GestureDetector(
                onTap: onActionTap,
                child: Container(
                  margin: const EdgeInsets.all(15),
                  child: SvgPicture.asset(
                    actionIconPath!,
                    height: 24,
                    width: 24,
                    color: null,
                  ),
                ),
              ),
            ]
          : null,
      backgroundColor: backgroundColor ?? AppColors.primary,
      centerTitle: true,
      title: Text(
        title,
        style: titleStyle ?? AppFonts.subtitle,
      ),
    );
  }
}
