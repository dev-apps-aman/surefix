import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/address/add_edit_address_provider.dart';
import '../../../utils/compo/custom_app_bar.dart';
import '../../../utils/compo/custom_btn.dart';
import '../../../utils/compo/custom_tf.dart';
import '../../models/address/address_model.dart';
import '../../utils/paths/colors_paths.dart';
import '../../utils/paths/fonts_paths.dart';
import '../../utils/paths/icons_paths.dart';

class AddEditAddressScreen extends StatelessWidget {
  final AddressModel? address;

  const AddEditAddressScreen({super.key, this.address});

  @override
  Widget build(BuildContext context) {
    final addressProvider =
        Provider.of<AddEditAddressProvider>(context, listen: false);

    if (address != null) {
      addressProvider.setAddress(address);
    } else {
      addressProvider.resetAddress();
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          address == null ? 'Add Address' : 'Edit Address',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: AppFonts.inter600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              _buildAddressPreview(),
              const SizedBox(height: 25),
              _buildLabel('Add Address Labels'),
              const SizedBox(height: 10),
              _buildFieldLabel('House No. & Floor'),
              const SizedBox(height: 10),
              _buildCustomTextField(addressProvider.houseController),
              const SizedBox(height: 16),
              _buildFieldLabel('Building & Block No. (optional)'),
              const SizedBox(height: 10),
              _buildCustomTextField(addressProvider.buildingController),
              const SizedBox(height: 16),
              _buildFieldLabel('Landmark & Area Name (optional)'),
              const SizedBox(height: 10),
              _buildCustomTextField(addressProvider.landmarkController),
              const SizedBox(height: 16),
              _buildLabel('Add Address Label'),
              const SizedBox(height: 10),
              _buildLabelSelection(addressProvider),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: AppColors.kGreyED,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: CustomBtn(
          text: address == null ? 'Add Address' : 'Update Address',
          onPressed: () {
            if (address == null) {
              addressProvider.saveAddress();
            } else {
              addressProvider.saveAddress();
            }
          },
        ),
      ),
    );
  }

  Widget _buildAddressPreview() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.kGreyED,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Adarsh Nager',
                  style: TextStyle(
                    color: AppColors.kNavyBlue,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontFamily: AppFonts.inter700,
                  ),
                ),
                const SizedBox(height: 13),
                Text(
                  '4th Floor, Plot No, H-458, 401, Jaipur, Raj.',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.kGrey4B,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            AppIcons.editAddressIc,
            height: 24,
            width: 24,
          ),
        ],
      ),
    );
  }

  Widget _buildLabelSelection(AddEditAddressProvider addressProvider) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            addressProvider.updateLabel('Home');
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            decoration: BoxDecoration(
              color: addressProvider.selectedLabel == 'Home'
                  ? AppColors.kBlackC
                  : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: addressProvider.selectedLabel == 'Home'
                    ? Colors.transparent
                    : AppColors.kGreyED,
              ),
            ),
            child: Text(
              'Home',
              style: TextStyle(
                color: addressProvider.selectedLabel == 'Home'
                    ? AppColors.kWhite
                    : AppColors.kGrey4B,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: AppFonts.inter500,
              ),
            ),
          ),
        ),
        const SizedBox(width: 6),
        InkWell(
          onTap: () {
            addressProvider.updateLabel('Work');
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            decoration: BoxDecoration(
              color: addressProvider.selectedLabel == 'Work'
                  ? AppColors.kBlackC
                  : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: addressProvider.selectedLabel == 'Work'
                    ? Colors.transparent
                    : AppColors.kGreyED,
              ),
            ),
            child: Text(
              'Work',
              style: TextStyle(
                color: addressProvider.selectedLabel == 'Work'
                    ? AppColors.kWhite
                    : AppColors.kGrey4B,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: AppFonts.inter500,
              ),
            ),
          ),
        ),
        const SizedBox(width: 6),
        InkWell(
          onTap: () {
            addressProvider.updateLabel('Other');
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            decoration: BoxDecoration(
              color: addressProvider.selectedLabel == 'Other'
                  ? AppColors.kBlackC
                  : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: addressProvider.selectedLabel == 'Other'
                    ? Colors.transparent
                    : AppColors.kGreyED,
              ),
            ),
            child: Text(
              'Other',
              style: TextStyle(
                color: addressProvider.selectedLabel == 'Other'
                    ? AppColors.kWhite
                    : AppColors.kGrey4B,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: AppFonts.inter500,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFieldLabel(String label) {
    return Text(
      label,
      style: TextStyle(
        color: AppColors.kGrey4B,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget _buildCustomTextField(TextEditingController controller,
      {bool isMobile = false}) {
    return Consumer<AddEditAddressProvider>(
      builder: (context, provider, child) {
        return CustomTf(
          controller: controller,
          onChanged: (value) {
            provider.validateForm();
          },
          filled: true,
          letterSpacing: 1,
          prefixIcon: isMobile
              ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    '+91',
                    style: TextStyle(
                      color: AppColors.kNavyBlue,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Gilroy',
                    ),
                  ),
                )
              : null,
        );
      },
    );
  }

  Widget _buildLabel(String label) {
    return Text(
      label,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        fontFamily: AppFonts.inter700,
      ),
    );
  }
}
