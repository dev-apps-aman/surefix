import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../provider/cart/cart_provider.dart';
import '../../../../utils/paths/colors_paths.dart';
import '../../../../utils/paths/fonts_paths.dart';
import '../../../../utils/paths/img_paths.dart';
import '../service_details_screen.dart';

class ServicesListsCard extends StatelessWidget {
  const ServicesListsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ServiceDetailsScreen(),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                AppImages.homeServiceManImg,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Power saver AC service',
                    maxLines: 1,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppFonts.inter600,
                    ),
                  ),
                  SizedBox(height: 7),
                  Text(
                    'Thorough cleaning of indoor unit with foam-jet spray',
                    maxLines: 2,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 13),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '₹299',
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
                        onTap: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .addToCart();
                        },
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
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
