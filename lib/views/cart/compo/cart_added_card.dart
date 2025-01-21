import 'package:flutter/material.dart';
import '../../../../utils/paths/colors_paths.dart';
import '../../../../utils/paths/fonts_paths.dart';
import '../../../../utils/paths/img_paths.dart';
import '../../dashboard/home/service_details_screen.dart';

class CartAddedCard extends StatelessWidget {
  const CartAddedCard({super.key});

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
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
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
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          '₹299',
                          style: TextStyle(
                            color: AppColors.kGrey4B,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontFamily: AppFonts.inter700,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.kBlue5053),
                          color: AppColors.kLavBlueF3,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 7),
                                child: Icon(
                                  Icons.remove,
                                  size: 12,
                                  color: AppColors.kBlue5053,
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              '01',
                              style: TextStyle(
                                color: AppColors.kBlue5053,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(width: 5),
                            InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 7),
                                child: Icon(
                                  Icons.add,
                                  size: 12,
                                  color: AppColors.kBlue5053,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
