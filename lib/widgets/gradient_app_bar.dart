import 'package:flutter/material.dart';
import 'package:pinterest_video_downloader/constants/app_colors.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final List<Widget> actions;
  const GradientAppBar({
    Key? key,
    required this.titleText,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.gradientColors,
        ),
      ),
      child: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(titleText),
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
