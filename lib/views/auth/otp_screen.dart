import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surefix/utils/compo/otp_tf.dart';
import 'package:surefix/utils/paths/colors_paths.dart';
import 'package:surefix/utils/paths/fonts_paths.dart';
import 'package:surefix/views/dashboard/dashboard_screen.dart';
import '../../provider/auth/otp_provider.dart';
import '../../utils/compo/custom_btn.dart';
import '../../utils/helpers/custom_text_styles.dart';
import '../../utils/paths/img_paths.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => OTPScreenState();
}

class OTPScreenState extends State<OTPScreen> {
  TextEditingController phoneController = TextEditingController();
  late OtpProvider otpProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      otpProvider = Provider.of<OtpProvider>(context, listen: false);
      otpProvider.startTimer();
    });
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back_outlined,
                            color: AppColors.kWhite),
                      ),
                      Image.asset(
                        AppImages.logoImgWhite,
                        fit: BoxFit.cover,
                        height: 54,
                        width: 54,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomTextStyles.headingText(
                    'OTP Verification',
                    fontSize: 30,
                  ),
                  const SizedBox(height: 12),
                  RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: 'We Have Sent A Verification Code To\n',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.kLightGreyC6,
                        fontWeight: FontWeight.w400,
                        fontFamily: AppFonts.inter400,
                      ),
                      children: [
                        TextSpan(
                          text: '+91 1234567890',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            fontFamily: AppFonts.inter700,
                            color: AppColors.kWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Consumer<OtpProvider>(
              builder: (BuildContext ctx, otpProvider, _) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      OtpTF(phoneController: phoneController),
                      const SizedBox(height: 15),
                      CustomTextStyles.subHeadingText(
                          'Check text messages for your OTP'),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Didn’t get the OTP?',
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.kBlackC,
                              fontWeight: FontWeight.w400,
                              fontFamily: AppFonts.inter400,
                            ),
                          ),
                          SizedBox(width: 5),
                          otpProvider.defaultOtpTime > 0
                              ? Text(
                                  'Resend SMS in ${otpProvider.defaultOtpTime}s',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: AppFonts.inter400,
                                    color: AppColors.kGrey9B,
                                  ),
                                )
                              : InkWell(
                                  onTap: otpProvider.resetTimer,
                                  child: const Text(
                                    'Resend OTP',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: AppFonts.inter400,
                                      color: AppColors.kGrey9B,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                      const SizedBox(height: 55),
                      CustomBtn(
                        text: 'Submit',
                        bgColor: AppColors.kBlackC,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DashboardScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
