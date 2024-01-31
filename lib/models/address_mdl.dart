import 'dart:convert';

class AddressModel {
  final String? status;
  final List<Address>? data;

  AddressModel({
    this.status,
    this.data,
  });

  factory AddressModel.fromJson(String str) =>
      AddressModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddressModel.fromMap(Map<String, dynamic> json) => AddressModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Address>.from(json["data"]!.map((x) => Address.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Address {
  final int? id;
  final String? name;
  final String? address;
  final String? phone;
  final String? provinceId;
  final String? cityId;
  final String? districtId;
  final String? postalCode;
  final int? userId;
  final int? isDefault;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Address({
    this.id,
    this.name,
    this.address,
    this.phone,
    this.provinceId,
    this.cityId,
    this.districtId,
    this.postalCode,
    this.userId,
    this.isDefault,
    this.createdAt,
    this.updatedAt,
  });

  String get fullAddress =>
      '$address. $cityId. $provinceId. $districtId. Zip Code $postalCode';
  String get addressType => isDefault == 1 ? 'Default' : 'Alt';

  factory Address.fromJson(String str) => Address.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Address.fromMap(Map<String, dynamic> json) => Address(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        provinceId: json["province_id"],
        cityId: json["city_id"],
        districtId: json["district_id"],
        postalCode: json["postal_code"],
        userId: json["user_id"],
        isDefault: json["is_default"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "address": address,
        "phone": phone,
        "province_id": provinceId,
        "city_id": cityId,
        "district_id": districtId,
        "postal_code": postalCode,
        "user_id": userId,
        "is_default": isDefault,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

// class AddressModel {
//   final String country;
//   final String firstName;
//   final String lastName;
//   final String address;
//   final String city;
//   final String province;
//   final int zipCode;
//   final String phoneNumber;
//   final bool isPrimary;

//   AddressModel({
//     required this.country,
//     required this.firstName,
//     required this.lastName,
//     required this.address,
//     required this.city,
//     required this.province,
//     required this.zipCode,
//     required this.phoneNumber,
//     this.isPrimary = false,
//   });

//   String get fullName => '$firstName $lastName';
//   String get fullAddress =>
//       '$address. $city. $province. $country. Zip Code $zipCode';
//   String get primaryAddressText => isPrimary ? 'Default' : 'Alt';
// }
