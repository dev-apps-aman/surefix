import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:surefix/utils/paths/colors_paths.dart';

class OtpTF extends StatelessWidget {
  const OtpTF({
    super.key,
    required this.phoneController,
  });

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: PinCodeTextField(
        appContext: context,
        length: 4,
        keyboardType: TextInputType.phone,
        obscureText: false,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(10),
          fieldHeight: 50,
          fieldWidth: 50,
          activeFillColor: AppColors.kWhite,
          selectedFillColor: AppColors.kWhite,
          disabledColor: AppColors.kGreyED,
          activeColor: AppColors.kBlackC,
          selectedColor: AppColors.kBlackC,
          inactiveColor: AppColors.kGreyED,
          inactiveFillColor: Colors.white,
          errorBorderColor: AppColors.kRed,
        ),
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        controller: phoneController,
        onCompleted: (v) {
          if (kDebugMode) {
            print("Completed");
          }
        },
        onChanged: (value) {
          if (kDebugMode) {
            print(value);
          }
        },
        beforeTextPaste: (text) {
          if (kDebugMode) {
            print("Allowing to paste $text");
          }
          return true;
        },
      ),
    );
  }
}
