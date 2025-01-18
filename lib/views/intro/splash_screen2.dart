import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/splash/splash_provider2.dart';
import '../../utils/paths/colors_paths.dart';
import '../../utils/paths/img_paths.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashProvider2>(
      builder: (context, splashProvider2, child) {
        if (splashProvider2.redirect) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            splashProvider2.checkRedirect(context);
          });
        }

        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.kWhite,
          ),
          child: Image.asset(
            AppImages.splashImg2,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
