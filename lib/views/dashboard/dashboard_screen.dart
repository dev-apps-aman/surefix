import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import '../../provider/dashboard/dashboard_provider.dart';
import '../../utils/paths/colors_paths.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final DashboardProvider dashboardController;
  @override
  void initState() {
    dashboardController = context.read<DashboardProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) {
            return;
          }
          final navigator = Navigator.of(context);
          bool willLeave = false;
          if (dashboardController.selectIdx != 0) {
            dashboardController.onItemTapped(0);
          } else {
            await showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: const Text(
                  'Are you sure you want to exit?',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      willLeave = true;
                      if (Platform.isAndroid) {
                        SystemNavigator.pop();
                      } else if (Platform.isIOS) {
                        exit(0);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    child: const Text(
                      'Yes',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text(
                      'No',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          if (willLeave) {
            navigator.pop();
          }
        },
        child: Consumer<DashboardProvider>(
          builder: (ctx, prov, child) {
            return Scaffold(
              body: IndexedStack(
                index: prov.selectIdx,
                children: prov.pages,
              ),
              bottomSheet: _buildBottomNavigationBar(context, prov),
            );
          },
        ));
  }

  Widget _buildBottomNavigationBar(
      BuildContext context, DashboardProvider prov) {
    final navItems = [
      {'icon': Icons.home, 'label': 'Home'},
      {'icon': Icons., 'label': 'Bookings'},
      {'icon': Icons.local_offer_outlined, 'label': 'Offers'},
      {'icon': Icons.account_circle, 'label': 'Account'},
    ];

    return Container(
      padding: EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        color: AppColors.kGreyED,
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: navItems.asMap().entries.map((entry) {
            int index = entry.key;
            Map<String, dynamic> item = entry.value;
            return _buildNavItem(
              icon: item['icon'] as IconData,
              label: item['label'] as String,
              isSelected: prov.selectIdx == index,
              onTap: () => prov.onItemTapped(index),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedScale(
              duration: const Duration(milliseconds: 200),
              scale: isSelected ? 1.1 : 1.0,
              child: Icon(
                icon,
                color: isSelected ? AppColors.kBlackC : AppColors.kLightGrey,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                // fontFamily: AppFonts.gilroy_700,
                color: isSelected ? AppColors.kBlackC : AppColors.kLightGrey,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
