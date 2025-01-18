import 'package:flutter/material.dart';

import '../paths/colors_paths.dart';

class CustomDropdownTf extends StatelessWidget {
  final List<DropdownMenuItem<String>> items;
  final String? selectedValue;
  final String? Function(String?)? validator;
  final Function(String?) onValueChanged;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final bool? filled;
  final Color? fillColor;

  final Color? dropdownColor;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final Color? focusborderColor;
  final Color? enableborderColor;
  final Color? errorborderColor;
  final Color? errorFocusborderColor;

  const CustomDropdownTf({
    super.key,
    required this.selectedValue,
    required this.onValueChanged,
    this.validator,
    required this.items,
    this.focusborderColor,
    this.enableborderColor,
    this.errorborderColor,
    this.errorFocusborderColor,
    this.textStyle,
    this.hintText,
    this.hintStyle,
    this.dropdownColor,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.filled = true,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    final enabledTfBorderColor = enableborderColor ?? AppColors.kLightGrey;
    final focusTfBorderColor = focusborderColor ?? AppColors.kLightGrey;
    final errorTfBorderColor = errorborderColor ?? AppColors.kRed;
    final errorFocusTfBorderColor = errorFocusborderColor ?? AppColors.kGrey;
    final effectiveFillColor = fillColor ?? Colors.white;

    // final effectiveHintStyle = hintStyle ??
    //     TextStyle(
    //       // fontWeight: FontWeight.w500,
    //       color: AppColors.kLightGrey,
    //       fontSize: 14,
    //     );
    // final effectiveTextStyle = textStyle ??
    //     TextStyle(
    //       fontWeight: FontWeight.w500,
    //       color: AppColors.kNavyBlue,
    //       fontSize: 14,
    //     );

    return DropdownButtonFormField<String>(
      value: selectedValue,
      onChanged: onValueChanged,
      items: items,
      dropdownColor: dropdownColor ?? Colors.white,
      iconEnabledColor: iconEnabledColor ?? Colors.black,
      iconDisabledColor: iconDisabledColor ?? Colors.grey,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle,
        filled: filled,
        fillColor: effectiveFillColor,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
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
      validator: validator,
    );
  }
}
