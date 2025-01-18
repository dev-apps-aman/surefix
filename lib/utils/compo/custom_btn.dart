import 'package:flutter/material.dart';
import '../paths/colors_paths.dart';
import '../paths/fonts_paths.dart';

class CustomBtn extends StatelessWidget {
  final String? text;
  final Widget? child;
  final Color? bgColor;
  final Color? borderColor;
  final TextStyle? textStyle;
  final Function()? onPressed;
  final double? height;
  final double? width;
  final double? radius;

  const CustomBtn({
    super.key,
    this.text,
    this.child,
    this.bgColor = AppColors.kBlackC,
    this.textStyle,
    this.onPressed,
    this.height,
    this.borderColor,
    this.radius = 16.0,
    this.width,
  }) : assert(
          text != null || child != null,
          'Either text or child must be provided',
        );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height ?? 46,
        width: width ?? double.maxFinite,
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(color: borderColor ?? Colors.transparent),
          borderRadius: BorderRadius.circular(radius!),
        ),
        alignment: Alignment.center,
        child: child ??
            Text(
              text!,
              style: textStyle ??
                  const TextStyle(
                    fontSize: 16,
                    color: AppColors.kWhite,
                    fontFamily: AppFonts.inter500,
                  ),
            ),
      ),
    );
  }
}
