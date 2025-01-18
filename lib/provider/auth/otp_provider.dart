import 'dart:async';
import 'package:flutter/material.dart';

class OtpProvider with ChangeNotifier {
  int defaultOtpTime = 30;
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (defaultOtpTime > 0) {
        defaultOtpTime--;
        notifyListeners();
      } else {
        timer.cancel();
      }
    });
  }

  void resetTimer() {
    timer?.cancel();
    defaultOtpTime = 30;
    notifyListeners();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
