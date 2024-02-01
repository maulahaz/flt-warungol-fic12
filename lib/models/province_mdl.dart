import 'dart:convert';

class ProvinceModel {
  final RajaongkirProvince? rajaongkir;

  ProvinceModel({
    this.rajaongkir,
  });

  factory ProvinceModel.fromJson(String str) =>
      ProvinceModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProvinceModel.fromMap(Map<String, dynamic> json) => ProvinceModel(
        rajaongkir: json["rajaongkir"] == null
            ? null
            : RajaongkirProvince.fromMap(json["rajaongkir"]),
      );

  Map<String, dynamic> toMap() => {
        "rajaongkir": rajaongkir?.toMap(),
      };
}

class RajaongkirProvince {
  final List<dynamic>? query;
  final StatusRajaongkirProvince? status;
  final List<Province>? results;

  RajaongkirProvince({
    this.query,
    this.status,
    this.results,
  });

  factory RajaongkirProvince.fromJson(String str) =>
      RajaongkirProvince.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RajaongkirProvince.fromMap(Map<String, dynamic> json) =>
      RajaongkirProvince(
        query: json["query"] == null
            ? []
            : List<dynamic>.from(json["query"]!.map((x) => x)),
        status: json["status"] == null
            ? null
            : StatusRajaongkirProvince.fromMap(json["status"]),
        results: json["results"] == null
            ? []
            : List<Province>.from(
                json["results"]!.map((x) => Province.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "query": query == null ? [] : List<dynamic>.from(query!.map((x) => x)),
        "status": status?.toMap(),
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toMap())),
      };
}

class Province {
  final String? provinceId;
  final String? province;

  Province({
    this.provinceId,
    this.province,
  });

  factory Province.fromJson(String str) => Province.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Province.fromMap(Map<String, dynamic> json) => Province(
        provinceId: json["province_id"],
        province: json["province"],
      );

  Map<String, dynamic> toMap() => {
        "province_id": provinceId,
        "province": province,
      };

  @override
  String toString() => '$province';
}

class StatusRajaongkirProvince {
  final int? code;
  final String? description;

  StatusRajaongkirProvince({
    this.code,
    this.description,
  });

  factory StatusRajaongkirProvince.fromJson(String str) =>
      StatusRajaongkirProvince.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StatusRajaongkirProvince.fromMap(Map<String, dynamic> json) =>
      StatusRajaongkirProvince(
        code: json["code"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "description": description,
      };
}
