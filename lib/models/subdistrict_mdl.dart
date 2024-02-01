import 'dart:convert';

class SubdistrictModel {
  final RajaongkirSubdistrict? rajaongkir;

  SubdistrictModel({
    this.rajaongkir,
  });

  factory SubdistrictModel.fromJson(String str) =>
      SubdistrictModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubdistrictModel.fromMap(Map<String, dynamic> json) =>
      SubdistrictModel(
        rajaongkir: json["rajaongkir"] == null
            ? null
            : RajaongkirSubdistrict.fromMap(json["rajaongkir"]),
      );

  Map<String, dynamic> toMap() => {
        "rajaongkir": rajaongkir?.toMap(),
      };
}

class RajaongkirSubdistrict {
  final QuerySubdistrict? query;
  final StatusSubdistrict? status;
  final List<Subdistrict>? results;

  RajaongkirSubdistrict({
    this.query,
    this.status,
    this.results,
  });

  factory RajaongkirSubdistrict.fromJson(String str) =>
      RajaongkirSubdistrict.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RajaongkirSubdistrict.fromMap(Map<String, dynamic> json) =>
      RajaongkirSubdistrict(
        query: json["query"] == null
            ? null
            : QuerySubdistrict.fromMap(json["query"]),
        status: json["status"] == null
            ? null
            : StatusSubdistrict.fromMap(json["status"]),
        results: json["results"] == null
            ? []
            : List<Subdistrict>.from(
                json["results"]!.map((x) => Subdistrict.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "query": query?.toMap(),
        "status": status?.toMap(),
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toMap())),
      };
}

class QuerySubdistrict {
  final String? city;

  QuerySubdistrict({
    this.city,
  });

  factory QuerySubdistrict.fromJson(String str) =>
      QuerySubdistrict.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QuerySubdistrict.fromMap(Map<String, dynamic> json) =>
      QuerySubdistrict(
        city: json["city"],
      );

  Map<String, dynamic> toMap() => {
        "city": city,
      };
}

class Subdistrict {
  final String? subdistrictId;
  final String? provinceId;
  final String? province;
  final String? cityId;
  final String? city;
  final String? type;
  final String? subdistrictName;

  Subdistrict({
    this.subdistrictId,
    this.provinceId,
    this.province,
    this.cityId,
    this.city,
    this.type,
    this.subdistrictName,
  });

  factory Subdistrict.fromJson(String str) =>
      Subdistrict.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Subdistrict.fromMap(Map<String, dynamic> json) => Subdistrict(
        subdistrictId: json["subdistrict_id"],
        provinceId: json["province_id"],
        province: json["province"],
        cityId: json["city_id"],
        city: json["city"],
        type: json["type"],
        subdistrictName: json["subdistrict_name"],
      );

  Map<String, dynamic> toMap() => {
        "subdistrict_id": subdistrictId,
        "province_id": provinceId,
        "province": province,
        "city_id": cityId,
        "city": city,
        "type": type,
        "subdistrict_name": subdistrictName,
      };

  @override
  String toString() => '$subdistrictName';
}

class StatusSubdistrict {
  final int? code;
  final String? description;

  StatusSubdistrict({
    this.code,
    this.description,
  });

  factory StatusSubdistrict.fromJson(String str) =>
      StatusSubdistrict.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StatusSubdistrict.fromMap(Map<String, dynamic> json) =>
      StatusSubdistrict(
        code: json["code"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "description": description,
      };
}
