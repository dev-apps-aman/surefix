import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surefix/utils/paths/colors_paths.dart';
import '../../provider/splash/splash_provider.dart';
import '../../utils/paths/img_paths.dart';

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashProvider>(
      builder: (context, splashProvider, child) {
        if (splashProvider.redirect) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            splashProvider.checkRedirect(context);
          });
        }

        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.kWhite,
          ),
          child: Image.asset(
            AppImages.splashImg,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
