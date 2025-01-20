import 'package:flutter/material.dart';
import 'package:surefix/utils/paths/fonts_paths.dart';

import '../../utils/compo/custom_app_bar.dart';
import '../../utils/compo/custom_search_bar.dart';
import '../../utils/paths/colors_paths.dart';
import '../../utils/paths/icons_paths.dart';

class YourLocationScreen extends StatelessWidget {
  const YourLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> addressList = [
      {
        'title': 'Adarsh Nager',
        'address':
            '4th Floor, Plot No, H-458, 401, Azad Marg, C Scheme, Ashok Nagar, Jaipur, Rajasthan 302001',
      },
      {
        'title': 'Adarsh Nager',
        'address': 'Tech Park, Plot 22, Cyber City, Gurgaon, Haryana 122002',
      },
      {
        'title': 'Adarsh Nager',
        'address': 'Flat 202, Palm Avenue, Andheri East, Mumbai, Maharashtra',
      },
      {
        'title': 'Adarsh Nager',
        'address': 'Flat 202, Palm Avenue, Andheri East, Mumbai, Maharashtra',
      },
      {
        'title': 'Adarsh Nager',
        'address': 'Flat 202, Palm Avenue, Andheri East, Mumbai, Maharashtra',
      },
    ];

    return Scaffold(
      appBar: CustomAppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Your Location',
          style: TextStyle(
            color: AppColors.kBlackC,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: AppFonts.inter600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            CustomSearchBar(
              hintText: 'Search New Address',
              suffixIcon: Icon(
                Icons.search,
                color: AppColors.kGrey4B,
                size: 20,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AppIcons.currentLocIc,
                  height: 15,
                  width: 15,
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Location',
                      style: TextStyle(
                        color: AppColors.kRedD1,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Current Location',
                      style: TextStyle(
                        color: AppColors.kGrey9B,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: addressList.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 14),
                itemBuilder: (context, index) {
                  final address = addressList[index];
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        AppIcons.locationIC,
                        height: 24,
                        width: 24,
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              address['title'],
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                fontFamily: AppFonts.inter700,
                              ),
                            ),
                            const SizedBox(height: 13),
                            Text(
                              address['address'],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColors.kGrey9B,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Divider()
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
