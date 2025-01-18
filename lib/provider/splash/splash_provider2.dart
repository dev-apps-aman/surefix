import 'package:flutter/material.dart';
import '../../views/auth/login_screen.dart';

class SplashProvider2 with ChangeNotifier {
  bool redirect = false;

  SplashProvider2() {
    Future.delayed(const Duration(seconds: 3), () {
      redirect = true;
      notifyListeners();
    });
  }

  void checkRedirect(BuildContext context) {
    if (redirect) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    }
  }
}
