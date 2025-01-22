import 'package:flutter/material.dart';

import '../../../utils/paths/colors_paths.dart';
import '../../../utils/paths/fonts_paths.dart';

class PaymentDetailsContainer extends StatelessWidget {
  const PaymentDetailsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 7),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kGreyED),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Payment Details',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              fontFamily: AppFonts.inter700,
            ),
          ),
          const SizedBox(height: 12),
          _buildPaymentRow('Item Total', '₹ 2000'),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 8),
          _buildPaymentRow('Discount (Code Show Here)', '₹ -100',
              valueColor: AppColors.kRed1313),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 8),
          _buildPaymentRow('Taxes and Fee', '₹ 10'),
          const SizedBox(height: 8),
          const Divider(),
          const SizedBox(height: 8),
          _buildPaymentRow(
            'Total',
            '₹ 1910',
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentRow(
    String label,
    String value, {
    Color valueColor = Colors.black,
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppColors.kGrey4B,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: valueColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
          ),
        ),
      ],
    );
  }
}
