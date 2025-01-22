import 'package:flutter/material.dart';
import '../../models/address/address_model.dart';

class AddEditAddressProvider extends ChangeNotifier {
  AddressModel? address;

  final TextEditingController houseController = TextEditingController();
  final TextEditingController buildingController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  String? selectedLabel;

  void setAddress(AddressModel? newAddress) {
    address = newAddress;
    if (address != null) {
      houseController.text = address!.houseNo;
      buildingController.text = address!.buildingName;
      landmarkController.text = address!.landmark;
      nameController.text = address!.receiverName;
      mobileController.text = address!.mobileNo;
      selectedLabel = address!.addressTitle;
    }
    notifyListeners();
  }

  void updateField(String field, String value) {
    if (address == null) return;

    address = address!.copyWith(
      houseNo: field == 'houseNo' ? value : address!.houseNo,
      buildingName: field == 'buildingName' ? value : address!.buildingName,
      landmark: field == 'landmark' ? value : address!.landmark,
      receiverName: field == 'receiverName' ? value : address!.receiverName,
      mobileNo: field == 'mobileNo' ? value : address!.mobileNo,
    );
    notifyListeners();
  }

  void updateLabel(String label) {
    if (address == null) return;
    selectedLabel = label;
    address = address!.copyWith(addressTitle: label);
    notifyListeners();
  }

  bool validateForm() {
    return houseController.text.trim().isNotEmpty &&
        nameController.text.trim().isNotEmpty &&
        mobileController.text.trim().isNotEmpty;
  }

  void resetAddress() {
    houseController.clear();
    buildingController.clear();
    landmarkController.clear();
    selectedLabel = ''; // Reset the label too
    notifyListeners();
  }

  void saveAddress() {
    if (validateForm()) {
      print('Address Saved: ${address?.toJson()}');
    } else {
      print('Validation failed. Address not saved.');
    }
  }
}
