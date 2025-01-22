import 'package:flutter/material.dart';
import '../../../utils/paths/colors_paths.dart';
import '../../../utils/paths/fonts_paths.dart';

class CartItemsDetailsWid extends StatelessWidget {
  final String serviceName;
  final String price;
  final String quantity;
  final String totalPrice;

  const CartItemsDetailsWid({
    super.key,
    required this.serviceName,
    required this.price,
    required this.quantity,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          serviceName,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            fontFamily: AppFonts.inter700,
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$price *$quantity',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.kGrey4B,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              totalPrice,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontFamily: AppFonts.inter700,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
