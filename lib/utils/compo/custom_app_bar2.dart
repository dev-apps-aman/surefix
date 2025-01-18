import 'package:flutter/material.dart';

import '../paths/colors_paths.dart';

class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Widget title;
  final bool showBackButton;
  final bool? centerTitle;

  const CustomAppBar2({
    super.key,
    this.backgroundColor,
    required this.title,
    this.showBackButton = true,
    this.centerTitle = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.kLight7Red,
        border: Border(
          bottom: BorderSide(color: AppColors.kBlackC, width: 2),
        ),
      ),
      child: title,
    );
  }
}
