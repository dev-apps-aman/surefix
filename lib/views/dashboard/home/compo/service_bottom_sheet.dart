import 'package:flutter/material.dart';

import '../../../../utils/paths/colors_paths.dart';
import '../../../../utils/paths/fonts_paths.dart';
import 'cat_gridview.dart';

class ServiceBottomSheet extends StatelessWidget {
  final VoidCallback onGridItemTap;

  const ServiceBottomSheet({super.key, required this.onGridItemTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 11),
            decoration: BoxDecoration(
              color: AppColors.kGreyED,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Other Services',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppFonts.inter600,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.cancel_outlined,
                    size: 24,
                    color: AppColors.kGrey4B,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Home Services At Your\n',
                    style: TextStyle(
                      color: AppColors.kBlackC,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppFonts.inter600,
                    ),
                    children: const [
                      TextSpan(
                        text: 'Doorstep With Surefix Solutions',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.kGrey4B,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                CatGridViewBuilder(
                  onTap: onGridItemTap,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
