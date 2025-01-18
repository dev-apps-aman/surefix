import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:surefix/utils/compo/custom_btn.dart';
import 'package:surefix/utils/compo/custom_tf.dart';
import 'package:surefix/utils/helpers/custom_text_styles.dart';
import 'package:surefix/utils/paths/colors_paths.dart';
import 'package:surefix/utils/paths/icons_paths.dart';
import 'package:surefix/utils/paths/img_paths.dart';
import 'package:surefix/views/auth/otp_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 53),
              width: double.maxFinite,
              color: AppColors.kBlackC,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AppImages.logoImgWhite,
                    fit: BoxFit.cover,
                    height: 54,
                    width: 54,
                  ),
                  const SizedBox(height: 20),
                  CustomTextStyles.headingText(
                    'Login Or Sign Up',
                    fontSize: 30,
                  ),
                  const SizedBox(height: 12),
                  CustomTextStyles.subHeadingText(
                    'Continue With your mobile Number',
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    CustomTextStyles.labelText('Mobile Number'),
                    const SizedBox(height: 6),
                    CustomTf(
                      controller: phoneController,
                      hintText: 'Enter Mobile Number',
                      suffixIcon: Image.asset(
                        AppIcons.mobileTfIc,
                        fit: BoxFit.cover,
                        height: 20,
                        width: 20,
                      ),
                    ),
                    const SizedBox(height: 70),
                    CustomBtn(
                      text: 'Continue',
                      bgColor: AppColors.kBlackC,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OTPScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 65.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'By Continuing, You Agree To Our ',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.kGrey4B,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: 'Terms Of Use ',
                      style: TextStyle(
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w400,
                        color: AppColors.kBlackC,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Terms Of Use tapped'),
                            ),
                          );
                        },
                    ),
                    TextSpan(
                      text: '&',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.kGrey4B,
                      ),
                    ),
                    TextSpan(
                      text: ' Privacy Policy',
                      style: TextStyle(
                        fontSize: 12,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w400,
                        color: AppColors.kBlackC,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Privacy Policy tapped'),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
