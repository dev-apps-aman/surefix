import 'package:flutter/material.dart';
import 'package:surefix/utils/compo/custom_btn.dart';
import 'package:surefix/utils/paths/fonts_paths.dart';
import 'package:surefix/utils/paths/img_paths.dart';
import 'package:surefix/views/dashboard/home/services_list_screen.dart';
import '../../../utils/compo/custom_image_slider.dart';
import '../../../utils/compo/custom_search_bar.dart';
import '../../../utils/paths/colors_paths.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imageList = [
      AppImages.homeCleanImg,
      AppImages.homeAcImg,
      AppImages.homeSolarImg,
      AppImages.homePaintmg,
      AppImages.homeElecImg,
      AppImages.homePlumberImg,
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xffFFFFFF),
                  Color(0xFFF3F3F3),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15),
                CustomSearchBar(
                  hintText: 'Search For “AC Service”',
                  suffixIcon: Icon(
                    Icons.search,
                    color: AppColors.kGrey4B,
                    size: 20,
                  ),
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    text: 'Home Services At Your\n',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppFonts.inter600,
                      color: AppColors.kBlackC,
                    ),
                    children: [
                      TextSpan(
                        text: 'Doorstep With  Surefix Solutions ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.kGrey4B,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: imageList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ServicesListScreen(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(40),
                              blurRadius: 6,
                              offset: Offset(0, 1),
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage(imageList[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: AppFonts.inter500,
                        ),
                      ),
                      SizedBox(width: 6),
                      Icon(
                        Icons.arrow_forward,
                        size: 24,
                        color: AppColors.kBlackC,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 6),
              ],
            ),
          ),
          SizedBox(height: 15),
          buildCustomHeader(
            title: 'AC & Appliance Repair',
            actionText: 'See All',
            onActionTap: () {
              print('See All tapped');
            },
          ),
          SizedBox(height: 15),
          HorizontalListViewBuilder(),
          SizedBox(height: 15),
          buildCustomHeader(
            title: 'Cleaning & Pest Control',
            actionText: 'See All',
            onActionTap: () {
              print('See All tapped');
            },
          ),
          SizedBox(height: 15),
          HorizontalListViewBuilder(),
          SizedBox(height: 15),
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
          SizedBox(height: 16),
          CustomImageSlider(
            height: 160,
            autoPlay: true,
            enlargeCenterPage: false,
          ),
          SizedBox(height: 30)
        ],
      ),
    );
  }

  Widget buildCustomHeader({
    required String title,
    required String actionText,
    required VoidCallback onActionTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: AppFonts.inter600,
              ),
            ),
          ),
          SizedBox(width: 30),
          InkWell(
            onTap: onActionTap,
            child: Text(
              actionText,
              style: const TextStyle(
                color: AppColors.kBlue5053,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalListViewBuilder extends StatelessWidget {
  const HorizontalListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 215,
      child: Padding(
        padding: const EdgeInsets.only(left: 13.0),
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return CatServiceCard();
          },
        ),
      ),
    );
  }
}

class CatServiceCard extends StatelessWidget {
  const CatServiceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 13),
      width: 165,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kGreyED),
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              AppImages.homeServiceImg,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Power saver AC service',
            maxLines: 1,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              color: AppColors.kGrey4B,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'Start At: ₹699',
            style: const TextStyle(
              color: AppColors.kBlackC,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              fontFamily: AppFonts.inter700,
            ),
          ),
          SizedBox(height: 8),
          CustomBtn(
            height: 30,
            radius: 6.0,
            text: 'Add To Cart',
            textStyle: TextStyle(
              color: AppColors.kBlue5053,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              fontFamily: AppFonts.inter700,
            ),
            bgColor: AppColors.kLavBlueF3,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
