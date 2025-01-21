import 'package:flutter/material.dart';
import 'package:surefix/utils/compo/custom_app_bar.dart';
import 'package:surefix/utils/compo/custom_btn.dart';
import 'package:surefix/utils/paths/colors_paths.dart';

import '../../utils/paths/fonts_paths.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Checkout',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: AppFonts.inter600,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppColors.kGreyED,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: 3,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                return cartItemDetails(
                  serviceName: 'Power saver AC service',
                  price: '₹299',
                  quantity: '02',
                  totalPrice: '₹598',
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Row
        ],
      ),
      bottomSheet: Container(
        color: AppColors.kGreyED,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: CustomBtn(
          text: 'Process to check out ',
        ),
      ),
    );
  }

  Widget cartItemDetails({
    required String serviceName,
    required String price,
    required String quantity,
    required String totalPrice,
  }) {
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
