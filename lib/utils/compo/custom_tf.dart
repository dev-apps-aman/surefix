import 'package:flutter/material.dart';
import '../paths/colors_paths.dart';

class CustomTf extends StatelessWidget {
  final String? hintText;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final bool? filled;
  final bool readOnly;
  final Color? focusborderColor;
  final Color? enableborderColor;
  final Color? errorborderColor;
  final Color? errorFocusborderColor;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final double? letterSpacing;
  final int? maxLength;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final String? errorText;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;

  const CustomTf({
    super.key,
    required this.controller,
    this.hintText,
    this.keyboardType,
    this.filled = false,
    this.fillColor,
    this.validator,
    this.prefixIcon,
    this.letterSpacing,
    this.hintStyle,
    this.textStyle,
    this.maxLength,
    this.readOnly = false,
    this.onChanged,
    this.textInputAction,
    this.onFieldSubmitted,
    this.errorText,
    this.focusborderColor,
    this.enableborderColor,
    this.errorborderColor,
    this.errorFocusborderColor,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveHintStyle = hintStyle ??
        TextStyle(
          letterSpacing: letterSpacing,
          fontWeight: FontWeight.w500,
          color: AppColors.kLightGrey,
          fontSize: 14,
        );
    final enabledTfBorderColor = enableborderColor ?? AppColors.kGreyED;
    final focusTfBorderColor = focusborderColor ?? AppColors.kBlackC;
    final errorTfBorderColor = errorborderColor ?? AppColors.kRed;
    final errorFocusTfBorderColor = errorFocusborderColor ?? AppColors.kGrey;
    final effectiveFillColor = fillColor ?? Colors.white;
    final effectiveTextStyle = textStyle ??
        TextStyle(
          letterSpacing: letterSpacing,
          fontWeight: FontWeight.w500,
          color: AppColors.kNavyBlue,
          fontSize: 14,
        );

    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      keyboardType: keyboardType ?? TextInputType.text,
      maxLength: maxLength,
      validator: validator,
      style: effectiveTextStyle,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: suffixIcon,
        ),
        isDense: true,
        suffixIconConstraints: BoxConstraints(minHeight: 24, minWidth: 24),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        counterText: '',
        errorText: errorText,
        prefixIcon: prefixIcon,
        hintText: hintText ?? '',
        filled: filled,
        fillColor: effectiveFillColor,
        hintStyle: effectiveHintStyle,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: enabledTfBorderColor),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusTfBorderColor),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: errorTfBorderColor),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: errorFocusTfBorderColor),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
