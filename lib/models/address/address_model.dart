class AddressModel {
  final String id;
  final String houseNo;
  final String buildingName;
  final String landmark;
  final String addressTitle;
  final String receiverName;
  final String mobileNo;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  final bool isDefault;

  AddressModel({
    required this.id,
    required this.houseNo,
    required this.buildingName,
    required this.landmark,
    required this.addressTitle,
    required this.receiverName,
    required this.mobileNo,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    this.isDefault = false,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'],
      houseNo: json['houseNo'],
      buildingName: json['buildingName'],
      landmark: json['landmark'],
      addressTitle: json['addressTitle'],
      receiverName: json['receiverName'],
      mobileNo: json['mobileNo'],
      city: json['city'],
      state: json['state'],
      postalCode: json['postalCode'],
      country: json['country'],
      isDefault: json['isDefault'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'houseNo': houseNo,
      'buildingName': buildingName,
      'landmark': landmark,
      'addressTitle': addressTitle,
      'receiverName': receiverName,
      'mobileNo': mobileNo,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'country': country,
      'isDefault': isDefault,
    };
  }

  AddressModel copyWith({
    String? id,
    String? houseNo,
    String? buildingName,
    String? landmark,
    String? addressTitle,
    String? receiverName,
    String? mobileNo,
    String? city,
    String? state,
    String? postalCode,
    String? country,
    bool? isDefault,
  }) {
    return AddressModel(
      id: id ?? this.id,
      houseNo: houseNo ?? this.houseNo,
      buildingName: buildingName ?? this.buildingName,
      landmark: landmark ?? this.landmark,
      addressTitle: addressTitle ?? this.addressTitle,
      receiverName: receiverName ?? this.receiverName,
      mobileNo: mobileNo ?? this.mobileNo,
      city: city ?? this.city,
      state: state ?? this.state,
      postalCode: postalCode ?? this.postalCode,
      country: country ?? this.country,
      isDefault: isDefault ?? this.isDefault,
    );
  }
}
