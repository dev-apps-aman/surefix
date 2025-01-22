import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:surefix/provider/address/add_edit_address_provider.dart';
import 'package:surefix/utils/paths/colors_paths.dart';
import 'package:surefix/utils/paths/fonts_paths.dart';
import 'provider/address/address_provider.dart';
import 'provider/auth/otp_provider.dart';
import 'provider/cart/cart_provider.dart';
import 'provider/dashboard/dashboard_provider.dart';
import 'provider/sliders/home_img_slider_provider.dart';
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
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.kBlackC,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashProvider()),
        ChangeNotifierProvider(create: (_) => SplashProvider2()),
        ChangeNotifierProvider(create: (_) => OtpProvider()),
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
        ChangeNotifierProvider(create: (_) => HomeImgSliderProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => AddressProvider()),
        ChangeNotifierProvider(create: (_) => AddEditAddressProvider()),
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
