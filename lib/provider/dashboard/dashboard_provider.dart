import 'package:flutter/material.dart';
import 'package:surefix/views/dashboard/account/account_screen.dart';
import 'package:surefix/views/dashboard/bookings/booking_screen.dart';
import 'package:surefix/views/dashboard/offers/offers_screen.dart';
import '../../views/dashboard/home/home_page.dart';

class DashboardProvider with ChangeNotifier {
  int selectIdx = 0;

  final List<Widget> pages = [
    HomePage(),
    BookingScreen(),
    OffersScreen(),
    AccountScreen(),
  ];

  void onItemTapped(int index) {
    selectIdx = index;
    notifyListeners();
  }
}
