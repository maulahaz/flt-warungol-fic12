import 'dart:convert';

class WarungListModel {
  final String? status;
  final List<Warung>? data;

  WarungListModel({
    this.status,
    this.data,
  });

  factory WarungListModel.fromJson(String str) =>
      WarungListModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory WarungListModel.fromMap(Map<String, dynamic> json) => WarungListModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Warung>.from(json["data"]!.map((x) => Warung.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Warung {
  final int? id;
  final String? name;
  final String? address;
  final String? phone;
  final String? email;
  final String? logo;
  final String? motto;
  final int? owner;
  final dynamic createdAt;
  final dynamic updatedAt;

  Warung({
    this.id,
    this.name,
    this.address,
    this.phone,
    this.email,
    this.logo,
    this.motto,
    this.owner,
    this.createdAt,
    this.updatedAt,
  });

  factory Warung.fromJson(String str) => Warung.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Warung.fromMap(Map<String, dynamic> json) => Warung(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        email: json["email"],
        logo: json["logo"],
        motto: json["motto"],
        owner: json["owner"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "address": address,
        "phone": phone,
        "email": email,
        "logo": logo,
        "motto": motto,
        "owner": owner,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
