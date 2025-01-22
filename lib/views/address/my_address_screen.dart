import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surefix/views/address/your_locations_screen.dart';
import '../../../provider/address/address_provider.dart';
import '../../../utils/compo/custom_app_bar.dart';
import '../../../utils/compo/custom_search_bar.dart';
import '../../models/address/address_model.dart';
import '../../utils/paths/colors_paths.dart';
import '../../utils/paths/fonts_paths.dart';
import '../../utils/paths/icons_paths.dart';
import 'add_edit_address_screen.dart';

class MyAddressScreen extends StatelessWidget {
  final bool isSelectionMode;

  const MyAddressScreen({
    super.key,
    this.isSelectionMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          isSelectionMode ? 'Select Address' : 'My Address',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: AppFonts.inter600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 17.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            if (!isSelectionMode) ...[
              CustomSearchBar(
                hintText: 'Search For “Address”',
                suffixIcon: Icon(
                  Icons.search,
                  color: AppColors.kGrey4B,
                  size: 20,
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const YourLocationScreen()),
                ),
              ),
              const SizedBox(height: 25),
              const CurrentLocRowWid(),
              const SizedBox(height: 25),
            ],
            Text(
              'Saved Location',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: AppFonts.inter600,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Consumer<AddressProvider>(
                builder: (context, addressProvider, _) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: addressProvider.addresses.length,
                    separatorBuilder: (_, __) => const Divider(),
                    itemBuilder: (context, index) {
                      final address = addressProvider.addresses[index];
                      return AddressRowWid(
                        address: address,
                        isSelectable: isSelectionMode,
                        showActions: !isSelectionMode,
                        onAddressSelected: isSelectionMode
                            ? (selectedAddress) {
                                addressProvider.selectAddress(selectedAddress);
                                Navigator.pop(context, selectedAddress);
                              }
                            : null,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CurrentLocRowWid extends StatelessWidget {
  const CurrentLocRowWid({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const YourLocationScreen()),
            );
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppIcons.currentLocIc,
                height: 16,
                width: 16,
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current Location',
                    style: TextStyle(
                      color: AppColors.kRed,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Using GPS',
                    style: TextStyle(
                      color: AppColors.kGrey9B,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddEditAddressScreen()),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.kLavBlueF3,
              border: Border.all(color: AppColors.kBlue5053),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              'Add Address',
              style: TextStyle(
                color: AppColors.kBlue5053,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Gilroy',
              ),
            ),
          ),
        )
      ],
    );
  }
}

class AddressRowWid extends StatelessWidget {
  final AddressModel address;
  final bool isSelectable;
  final Function(AddressModel)? onAddressSelected;
  final bool showActions;
  const AddressRowWid({
    super.key,
    required this.address,
    this.isSelectable = false,
    this.onAddressSelected,
    this.showActions = true,
  });

  Future<void> _showDeleteConfirmationDialog(
    BuildContext context,
    AddressProvider addressProvider,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: const Text('Are you sure you want to delete this address?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                addressProvider.removeAddress(address.id);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressProvider>(
      builder: (context, addressProvider, _) {
        return InkWell(
          onTap: isSelectable && onAddressSelected != null
              ? () => onAddressSelected!(address)
              : null,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppIcons.locationIC,
                height: 24,
                width: 24,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          address.addressTitle,
                          style: TextStyle(
                            color: AppColors.kNavyBlue,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontFamily: AppFonts.inter700,
                          ),
                        ),
                        if (address.isDefault)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.kGreen24,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text(
                              'Primary',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 13),
                    Text(
                      '${address.houseNo}, ${address.buildingName}, ${address.landmark}',
                      softWrap: true,
                      style: TextStyle(
                        color: AppColors.kGrey4B,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    if (showActions) ...[
                      const SizedBox(height: 13),
                      Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              final result = await Navigator.push<AddressModel>(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddEditAddressScreen(
                                    address: address,
                                  ),
                                ),
                              );
                              if (result != null) {
                                addressProvider.updateAddress(result);
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.kGreyF4,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.edit,
                                    color: AppColors.kGrey,
                                    size: 14,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    'Edit',
                                    style: TextStyle(
                                      color: AppColors.kGrey,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: AppFonts.inter500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          InkWell(
                            onTap: () => _showDeleteConfirmationDialog(
                              context,
                              addressProvider,
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.kLightRedD3,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.delete_outlined,
                                    color: AppColors.kRed,
                                    size: 14,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    'Delete',
                                    style: TextStyle(
                                      color: AppColors.kRed,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: AppFonts.inter500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                    ],
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
