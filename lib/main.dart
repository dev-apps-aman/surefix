import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surefix/utils/paths/colors_paths.dart';
import 'package:surefix/utils/paths/fonts_paths.dart';

import 'provider/auth/otp_provider.dart';
import 'provider/dashboard/dashboard_provider.dart';
import 'provider/splash/splash_provider.dart';
import 'provider/splash/splash_provider2.dart';
import 'utils/theme/text_theme.dart';
import 'views/intro/splash_screen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => SplashProvider2()),
        ChangeNotifierProvider(create: (_) => OtpProvider()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.kWhite,
          fontFamily: AppFonts.defaultFontFamily,
          textTheme: AppTextTheme.textTheme,
        ),
        home: const SplashScreen1(),
      ),
    );
  }
}
