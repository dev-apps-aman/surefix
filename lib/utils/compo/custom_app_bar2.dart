import 'package:flutter/material.dart';
import '../../views/address/your_locations_screen.dart';
import '../helpers/custom_text_styles.dart';
import '../paths/colors_paths.dart';
import '../paths/icons_paths.dart';

class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final Color? backgroundColor;
  final Widget? child;
  final bool showBackButton;
  final bool? centerTitle;

  const CustomAppBar2({
    super.key,
    this.backgroundColor,
    this.showBackButton = false,
    this.centerTitle = false,
    this.child,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12, right: 12, top: 44),
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        border: Border(
          bottom: BorderSide(color: AppColors.kLightGreyC6, width: 1),
        ),
      ),
      child: child ?? AppBarWidget(),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => YourLocationScreen()),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppIcons.sendIc,
                      height: 20,
                      width: 20,
                    ),
                    SizedBox(width: 6),
                    CustomTextStyles.headingText(
                      'Ashok Nager',
                      fontSize: 14,
                      color: AppColors.kBlackC,
                    )
                  ],
                ),
                SizedBox(height: 6),
                Text(
                  '4th Floor, Plot No, H-458, 401, Azad Marg,',
                  maxLines: 1,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 12,
                    color: AppColors.kGrey556,
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(width: 70),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.kGreyED,
              border: Border.all(color: AppColors.kGreyB9)),
          child: Icon(
            Icons.shopping_cart_outlined,
            size: 24,
          ),
        )
      ],
    );
  }
}
