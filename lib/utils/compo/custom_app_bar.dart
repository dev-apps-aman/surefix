import 'package:flutter/material.dart';
import 'package:surefix/utils/paths/colors_paths.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final EdgeInsetsGeometry? actionsPadding;
  final Color? backgroundColor;
  final Color? shadowColor;
  final Widget title;
  final TextStyle? textStyle;
  final bool showBackButton;
  final double? leadingWidth;
  final bool? centerTitle;

  const CustomAppBar({
    super.key,
    this.actions,
    this.actionsPadding,
    this.backgroundColor,
    required this.title,
    this.textStyle,
    this.showBackButton = true,
    this.leadingWidth,
    this.shadowColor,
    this.centerTitle = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: showBackButton
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back_outlined,
                size: 24,
                color: AppColors.kBlackC,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              padding: const EdgeInsets.only(left: 0.0),
              constraints: const BoxConstraints(minWidth: 30, minHeight: 30),
            )
          : null,
      scrolledUnderElevation: 0,
      centerTitle: centerTitle,
      leadingWidth: showBackButton ? (leadingWidth ?? 56) : 0,
      automaticallyImplyLeading: false,
      backgroundColor: backgroundColor ?? Colors.white10,
      elevation: 0,
      title: title,
      titleSpacing: showBackButton ? 0 : 16,
      actions: actions?.map((action) {
        return Padding(
          padding: actionsPadding ?? const EdgeInsets.only(right: 8.0),
          child: action,
        );
      }).toList(),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(2),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColors.kLightGreyC6, width: 1),
            ),
          ),
          height: 2,
        ),
      ),
    );
  }
}
