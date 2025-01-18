import 'package:flutter/material.dart';
import '../paths/colors_paths.dart';
import '../paths/fonts_paths.dart';

class CustomTextStyles {
  static Text headingText(String text,
      {double? fontSize,
      Color? color,
      FontWeight? fontWeight,
      String? fontFamily}) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? AppColors.kWhite,
        fontFamily: fontFamily ?? AppFonts.inter700,
        fontWeight: fontWeight ?? FontWeight.w700,
        fontSize: fontSize ?? 18,
      ),
    );
  }

  static Text subHeadingText(String text,
      {double? fontSize, Color? color, FontWeight? fontWeight}) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? AppColors.kLightGreyC6,
        fontSize: fontSize ?? 12,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontFamily: AppFonts.inter400,
      ),
    );
  }

  static Text labelText(String text,
      {double? fontSize, Color? color, FontWeight? fontWeight}) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? AppColors.kBlackC,
        fontSize: fontSize ?? 12,
        fontWeight: fontWeight ?? FontWeight.w400,
        fontFamily: AppFonts.inter400,
      ),
    );
  }
}
