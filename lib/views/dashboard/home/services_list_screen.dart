import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/cart/cart_provider.dart';
import '../../../utils/compo/custom_app_bar.dart';
import '../../../utils/paths/colors_paths.dart';
import '../../../utils/paths/fonts_paths.dart';
import '../../../utils/paths/icons_paths.dart';
import 'compo/service_bottom_Sheet.dart';
import '../../cart/cart_screen.dart';
import 'compo/services_lists_card_wid.dart';

class ServicesListScreen extends StatelessWidget {
  const ServicesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20)),
                  ),
                  builder: (BuildContext context) {
                    return ServiceBottomSheet(
                      onGridItemTap: () {},
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
        body: Column(
          children: [
            // List of services
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: 4,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) {
                    return ServicesListsCard();
                  },
                ),
              ),
            ),
            // Cart button
            Consumer<CartProvider>(
              builder: (context, cartProvider, child) {
                return cartProvider.cartItemCount > 0
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 6,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        margin: const EdgeInsets.only(
                            bottom: 20, left: 20, right: 20),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CartScreen(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'View Cart (${cartProvider.cartItemCount})',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
