import 'package:flutter/material.dart';
import '../../views/intro/splash_screen2.dart';

class SplashProvider with ChangeNotifier {
  bool redirect = false;

  SplashProvider() {
    Future.delayed(const Duration(seconds: 3), () {
      redirect = true;
      notifyListeners();
    });
  }

  void checkRedirect(BuildContext context) {
    if (redirect) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => SplashScreen2()),
      );
    }
  }
}
