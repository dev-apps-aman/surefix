import 'package:flutter/material.dart';
import 'package:surefix/utils/compo/custom_app_bar.dart';
import 'package:surefix/utils/compo/custom_search_bar.dart';
import 'package:surefix/utils/paths/colors_paths.dart';
import '../../../utils/paths/fonts_paths.dart';
import '../../../utils/paths/icons_paths.dart';

class CouponCodeScreen extends StatelessWidget {
  const CouponCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Coupon Code',
          style: TextStyle(
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
            SizedBox(height: 14),
            CustomSearchBar(
              hintText: 'Enter Coupon Code',
              controller: searchController,
              suffixIcon: InkWell(
                onTap: () {},
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors.kBlack,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Apply',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.kWhite,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 14),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              separatorBuilder: (context, index) => SizedBox(height: 14),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: AppColors.kGreyED,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                AppIcons.tealPercentIc,
                                height: 24,
                                width: 24,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 6),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'LNR00010',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    '20% Discount',
                                    style: TextStyle(
                                      color: AppColors.kGrey97,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppColors.kBlack,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Apply',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: AppColors.kWhite,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 7),
                      Divider(color: AppColors.kLightGreyC6),
                      SizedBox(height: 10),
                      Text(
                        'Applicable on transaction above ₹ 599+ More',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.kGrey4B,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
