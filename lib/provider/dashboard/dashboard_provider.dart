import 'package:flutter/material.dart';
import '../../views/dashboard/home/home_page.dart';

class DashboardProvider with ChangeNotifier {
  int selectIdx = 0;

  final List<Widget> pages = [
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
  ];

  void onItemTapped(int index) {
    selectIdx = index;
    notifyListeners();
  }
}
