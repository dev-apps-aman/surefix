import 'package:flutter/material.dart';
import '../paths/colors_paths.dart';

class CustomSearchBar extends StatelessWidget {
  final String? hintText;
  final String? prefixText;
  final TextInputType? keyboardType;
  final bool? filled;
  final Color? fillColor;
  final Color? borderColor;
  final String? Function(String?)? validator;
  final Widget? prefix;
  final Widget? suffixIcon;
  final double? letterSpacing;
  final TextStyle? hintStyle;
  final TextEditingController? controller;
  final VoidCallback? onTap;

  const CustomSearchBar({
    super.key,
    this.hintText,
    this.prefixText,
    this.keyboardType,
    this.filled,
    this.fillColor,
    this.borderColor,
    this.validator,
    this.prefix,
    this.suffixIcon,
    this.letterSpacing,
    this.hintStyle,
    this.controller,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AbsorbPointer(
        absorbing: onTap != null,
        child: SizedBox(
          height: 48,
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType ?? TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: prefix,
              suffixIcon: suffixIcon,
              hintText: hintText ?? '',
              filled: filled ?? false,
              fillColor: fillColor ?? Colors.transparent,
              hintStyle: hintStyle ??
                  TextStyle(
                    color: AppColors.kGrey,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: borderColor ?? AppColors.kLightGreyC6,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor ?? AppColors.kBlack),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
            ),
            style: TextStyle(
              letterSpacing: letterSpacing,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
