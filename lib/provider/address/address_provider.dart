import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/address/address_model.dart';

class AddressProvider extends ChangeNotifier {
  Map<String, AddressModel> addressMap = {
    '1': AddressModel(
      id: '1',
      houseNo: '101',
      buildingName: 'Sunset Apartments',
      landmark: 'Near City Park',
      addressTitle: 'Home',
      receiverName: 'John Doe',
      mobileNo: '9876543210',
      city: 'New York',
      state: 'NY',
      postalCode: '10001',
      country: 'USA',
      isDefault: true,
    ),
    '2': AddressModel(
      id: '2',
      houseNo: '202',
      buildingName: 'Greenfield Residency',
      landmark: 'Near Central Library',
      addressTitle: 'Office',
      receiverName: 'Jane Smith',
      mobileNo: '9876543211',
      city: 'Los Angeles',
      state: 'CA',
      postalCode: '90001',
      country: 'USA',
      isDefault: false,
    ),
    '3': AddressModel(
      id: '3',
      houseNo: '303',
      buildingName: 'Ocean View Tower',
      landmark: 'Opposite Beach',
      addressTitle: 'Vacation Home',
      receiverName: 'Alice Cooper',
      mobileNo: '9876543212',
      city: 'Miami',
      state: 'FL',
      postalCode: '33101',
      country: 'USA',
      isDefault: false,
    ),
  };

  AddressModel? selectedAddress;

  AddressProvider() {
    loadSelectedAddress();
  }

  List<AddressModel> get addresses => addressMap.values.toList();
  bool get hasSelectedAddress => selectedAddress != null;

  Future<void> loadSelectedAddress() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final savedAddressJson = prefs.getString('selectedAddress');
      if (savedAddressJson != null) {
        final addressData = jsonDecode(savedAddressJson);
        selectedAddress = AddressModel.fromJson(addressData);
        notifyListeners();
      }
    } catch (e) {
      debugPrint("Error loading selected address: $e");
    }
  }

  Future<void> saveSelectedAddress() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      if (selectedAddress != null) {
        final addressJson = jsonEncode(selectedAddress!.toJson());
        await prefs.setString('selectedAddress', addressJson);
      } else {
        await prefs.remove('selectedAddress');
      }
    } catch (e) {
      debugPrint("Error saving selected address: $e");
    }
  }

  void addAddress(AddressModel address) {
    addressMap[address.id] = address;
    notifyListeners();
  }

  void updateAddress(AddressModel updatedAddress) {
    if (addressMap.containsKey(updatedAddress.id)) {
      addressMap[updatedAddress.id] = updatedAddress;

      if (selectedAddress?.id == updatedAddress.id) {
        selectedAddress = updatedAddress;
        saveSelectedAddress();
      }

      notifyListeners();
    }
  }

  void removeAddress(String id) {
    if (addressMap.containsKey(id)) {
      addressMap.remove(id);

      if (selectedAddress?.id == id) {
        selectedAddress = null;
        saveSelectedAddress();
      }

      notifyListeners();
    }
  }

  void selectAddress(AddressModel address) {
    selectedAddress = address;
    saveSelectedAddress();
    notifyListeners();
  }

  void clearSelectedAddress() {
    selectedAddress = null;
    saveSelectedAddress();
    notifyListeners();
  }
}
