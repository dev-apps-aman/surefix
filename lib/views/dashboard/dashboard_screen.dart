import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import '../../provider/dashboard/dashboard_provider.dart';
import '../../utils/compo/custom_app_bar2.dart';
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
              resizeToAvoidBottomInset: false,
              appBar: CustomAppBar2(),
              body: IndexedStack(
                index: prov.selectIdx,
                children: prov.pages,
              ),
              bottomNavigationBar: _buildBottomNavigationBar(context, prov),
            );
          },
        ));
  }

  Widget _buildBottomNavigationBar(
      BuildContext context, DashboardProvider prov) {
    final navItems = [
      {
        'iconSelected': Icons.home_filled,
        'iconUnselected': Icons.home_outlined,
        'label': 'Home'
      },
      {
        'iconSelected': Icons.receipt,
        'iconUnselected': Icons.receipt_outlined,
        'label': 'Bookings'
      },
      {
        'iconSelected': Icons.local_offer,
        'iconUnselected': Icons.local_offer_outlined,
        'label': 'Offers'
      },
      {
        'iconSelected': Icons.person,
        'iconUnselected': Icons.person_outline,
        'label': 'Account'
      },
    ];

    return Container(
      padding: const EdgeInsets.only(bottom: 10),
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
              iconSelected: item['iconSelected'] as IconData,
              iconUnselected: item['iconUnselected'] as IconData,
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
    required IconData iconSelected,
    required IconData iconUnselected,
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
            Icon(
              isSelected ? iconSelected : iconUnselected,
              color: isSelected ? AppColors.kBlackC : AppColors.kGrey4B,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? AppColors.kBlackC : AppColors.kGrey4B,
                fontWeight: isSelected ? FontWeight.w400 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
