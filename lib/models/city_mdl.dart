import 'dart:convert';

class CityModel {
  final RajaongkirCity? rajaongkir;

  CityModel({
    this.rajaongkir,
  });

  factory CityModel.fromJson(String str) => CityModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CityModel.fromMap(Map<String, dynamic> json) => CityModel(
        rajaongkir: json["rajaongkir"] == null
            ? null
            : RajaongkirCity.fromMap(json["rajaongkir"]),
      );

  Map<String, dynamic> toMap() => {
        "rajaongkir": rajaongkir?.toMap(),
      };
}

class RajaongkirCity {
  final QueryCity? query;
  final StatusCity? status;
  final List<City>? results;

  RajaongkirCity({
    this.query,
    this.status,
    this.results,
  });

  factory RajaongkirCity.fromJson(String str) =>
      RajaongkirCity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RajaongkirCity.fromMap(Map<String, dynamic> json) => RajaongkirCity(
        query: json["query"] == null ? null : QueryCity.fromMap(json["query"]),
        status:
            json["status"] == null ? null : StatusCity.fromMap(json["status"]),
        results: json["results"] == null
            ? []
            : List<City>.from(json["results"]!.map((x) => City.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "query": query?.toMap(),
        "status": status?.toMap(),
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toMap())),
      };
}

class QueryCity {
  final String? province;

  QueryCity({
    this.province,
  });

  factory QueryCity.fromJson(String str) => QueryCity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory QueryCity.fromMap(Map<String, dynamic> json) => QueryCity(
        province: json["province"],
      );

  Map<String, dynamic> toMap() => {
        "province": province,
      };
}

class City {
  final String? cityId;
  final String? provinceId;
  final String? province;
  final String? type;
  final String? cityName;
  final String? postalCode;

  City({
    this.cityId,
    this.provinceId,
    this.province,
    this.type,
    this.cityName,
    this.postalCode,
  });

  factory City.fromJson(String str) => City.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory City.fromMap(Map<String, dynamic> json) => City(
        cityId: json["city_id"],
        provinceId: json["province_id"],
        province: json["province"],
        type: json["type"],
        cityName: json["city_name"],
        postalCode: json["postal_code"],
      );

  Map<String, dynamic> toMap() => {
        "city_id": cityId,
        "province_id": provinceId,
        "province": province,
        "type": type,
        "city_name": cityName,
        "postal_code": postalCode,
      };

  @override
  String toString() => '$cityName';
}

class StatusCity {
  final int? code;
  final String? description;

  StatusCity({
    this.code,
    this.description,
  });

  factory StatusCity.fromJson(String str) =>
      StatusCity.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StatusCity.fromMap(Map<String, dynamic> json) => StatusCity(
        code: json["code"],
        description: json["description"],
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "description": description,
      };
}
