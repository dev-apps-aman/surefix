import 'package:flutter/material.dart';
import 'package:surefix/utils/compo/custom_app_bar.dart';
import 'package:surefix/utils/compo/custom_btn.dart';
import 'package:surefix/utils/paths/colors_paths.dart';
import 'package:surefix/views/cart/checkout_screen.dart';

import '../../utils/paths/fonts_paths.dart';
import 'compo/cart_added_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Cart',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: AppFonts.inter600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: 4,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            return CartAddedCard();
          },
        ),
      ),
      bottomSheet: Container(
        color: AppColors.kGreyED,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: CustomBtn(
          text: 'Process to check out ',
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutScreen(),
                ));
          },
        ),
      ),
    );
  }
}
