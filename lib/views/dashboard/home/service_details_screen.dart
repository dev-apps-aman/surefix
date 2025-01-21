import 'package:flutter/material.dart';
import 'package:surefix/utils/paths/img_paths.dart';
import '../../../utils/compo/custom_app_bar.dart';
import '../../../utils/paths/colors_paths.dart';
import '../../../utils/paths/fonts_paths.dart';
import '../../../utils/paths/icons_paths.dart';
import 'compo/service_bottom_Sheet.dart';
import 'home_page.dart';
import 'services_list_screen.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'AC & Appliance',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: AppFonts.inter600,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (BuildContext context) {
                  return ServiceBottomSheet(
                    onGridItemTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ServicesListScreen(),
                        ),
                      );
                    },
                  );
                },
              );
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.kGreyED,
                border: Border.all(color: AppColors.kGreyB9),
              ),
              child: Image.asset(
                AppIcons.menuIc,
                height: 24,
                width: 24,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              AppImages.homeServiceMan2Img,
              height: 162,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '₹299',
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              fontFamily: AppFonts.inter700,
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                                color: AppColors.kGrey4B,
                                shape: BoxShape.circle),
                          ),
                          SizedBox(width: 5),
                          Text(
                            '60 Min',
                            maxLines: 2,
                            style: TextStyle(
                              color: AppColors.kGrey4B,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 11, vertical: 7),
                          decoration: BoxDecoration(
                            color: AppColors.kLavBlueF3,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            'Add To Cart',
                            style: TextStyle(
                              color: AppColors.kBlue5053,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14),
                  Text(
                    'Power saver AC service',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppFonts.inter600,
                    ),
                  ),
                  SizedBox(height: 14),
                  Text(
                    'Keep your air conditioning system in peak condition while saving energy and reducing costs with our Power Saver AC Service. This specialized service focuses on optimizing your AC’s performance for maximum efficiency, ensuring it consumes less power while delivering superior cooling.Our service includes:',
                    style: TextStyle(
                      color: AppColors.kGrey4B,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 35),
                  Row(
                    children: [
                      Image.asset(
                        AppIcons.rightIc,
                        height: 20,
                        width: 20,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 7),
                      Text(
                        'SS Cover',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: AppFonts.inter600,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 5.0),
              child: Row(
                children: [
                  reusableCard(
                    imagePath: AppIcons.shieldIc,
                    text: '30-Day Warranty',
                  ),
                  reusableCard(
                    imagePath: AppIcons.techPersonIc,
                    text: 'Instructor Partner',
                  ),
                  reusableCard(
                    imagePath: AppIcons.groupPersonIc,
                    text: 'Easy TO Claim',
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Container(
              color: AppColors.kGreyFB,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 14),
                  Text(
                    'Why choose Power Saver AC Service?',
                    style: TextStyle(
                      color: AppColors.kGrey4B,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppFonts.inter600,
                    ),
                  ),
                  SizedBox(height: 18),
                  dynamicRowText(
                    icon: Icons.done,
                    backgroundColor: AppColors.kGreen24,
                    text:
                        'Reduce electricity bills with optimized power consumption.',
                  ),
                  SizedBox(height: 10),
                  dynamicRowText(
                    icon: Icons.done,
                    backgroundColor: AppColors.kGreen24,
                    text: 'Enhance cooling efficiency and comfort.',
                  ),
                  SizedBox(height: 10),
                  dynamicRowText(
                    icon: Icons.done,
                    backgroundColor: AppColors.kGreen24,
                    text: 'Prolong the lifespan of your AC unit.',
                  ),
                  SizedBox(height: 10),
                  dynamicRowText(
                    icon: Icons.done,
                    backgroundColor: AppColors.kGreen24,
                    text:
                        'Contribute to a greener environment with reduced energy wastage.',
                  ),
                  SizedBox(height: 14),
                ],
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.homeMostTrandBG),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          height: 1,
                          color: AppColors.kBlue5053.withAlpha(120),
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 13, vertical: 6),
                        decoration: BoxDecoration(
                            color: AppColors.kWhite.withAlpha(125),
                            border: Border.all(
                                color: AppColors.kBlue5053.withAlpha(120)),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          'Most Trending Service',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: AppFonts.inter600,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          height: 1,
                          color: AppColors.kBlue5053.withAlpha(120),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  HorizontalListViewBuilder(),
                  SizedBox(height: 16),
                ],
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget reusableCard({required String imagePath, required String text}) {
    return Flexible(
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding:
            const EdgeInsets.only(top: 13, left: 12, bottom: 13, right: 20),
        decoration: BoxDecoration(
          color: AppColors.kGreyF8,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              height: 30,
              width: 30,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 12),
            Text(
              text,
              style: TextStyle(
                color: AppColors.kGrey4B,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: AppFonts.inter500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget dynamicRowText({
    required IconData icon,
    required Color backgroundColor,
    required String text,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: AppColors.kWhite,
            size: 18,
          ),
        ),
        const SizedBox(width: 11),
        Flexible(
          child: Text(
            text,
            style: TextStyle(
              color: AppColors.kGrey4B,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: AppFonts.inter500,
            ),
          ),
        ),
      ],
    );
  }
}
