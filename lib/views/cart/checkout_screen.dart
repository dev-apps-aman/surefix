import 'package:flutter/material.dart';
import 'package:surefix/utils/compo/custom_app_bar.dart';
import 'package:surefix/utils/compo/custom_btn.dart';
import 'package:surefix/utils/paths/colors_paths.dart';
import '../../utils/paths/fonts_paths.dart';
import '../../utils/paths/icons_paths.dart';
import '../address/my_address_screen.dart';
import 'compo/cart_items_details_wid.dart';
import 'compo/labeled_icon_row_wid.dart';
import 'compo/payment_details_container_wid.dart';
import 'coupons/coupon_code_screen.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> bookingDetailsList = [
      {
        'labelText': 'Send booking details to',
        'subText': '12345 67890',
        'showEditButton': false,
        'icon': Icons.phone_iphone_rounded,
      },
      {
        'labelText': 'Address',
        'subText': '4th Floor, Plot No, H-458, 401, Azad Marg,',
        'showEditButton': true,
        'icon': Icons.location_on_rounded,
        'onEdit': () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => MyAddressScreen()));
        },
      },
      {
        'labelText': 'Time Slot',
        'subText': '------',
        'showEditButton': true,
        'onEdit': () {
          print('Edit clicked for WhatsApp');
        },
        'conatainerText': 'Add',
        'icon': Icons.access_time,
      },
    ];

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: AppColors.kGreyED,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  return CartItemsDetailsWid(
                    serviceName: 'Power saver AC service',
                    price: '₹299',
                    quantity: '02',
                    totalPrice: '₹598',
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: bookingDetailsList.length,
                    separatorBuilder: (context, index) => SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final item = bookingDetailsList[index];
                      return LabeledIconRowWid(
                        labelText: item['labelText'],
                        subText: item['subText'],
                        showEditButton: item['showEditButton'] ?? false,
                        containerText: item['conatainerText'],
                        onEdit: item['onEdit'],
                        icon: item['icon'],
                      );
                    },
                  ),
                  SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CouponCodeScreen(),
                          ));
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                      decoration: BoxDecoration(
                        color: AppColors.kGreyED,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            AppIcons.tealPercentIc,
                            height: 24,
                            width: 24,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              'Coupons and offers',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  PaymentDetailsContainer(),
                  SizedBox(height: 6),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Accept Cancellation Policy',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        fontFamily: AppFonts.inter500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 120)
          ],
        ),
      ),
      bottomSheet: Container(
        color: AppColors.kGreyED,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: CustomBtn(
          text: 'Process to Pay',
        ),
      ),
    );
  }
}
