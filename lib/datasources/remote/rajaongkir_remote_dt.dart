import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../configs/x_configs.dart';
import '../../models/x_models.dart';

class RajaongkirRemoteData {
//
  //--Get Data:
  // ========================================================================
  static Future<Either<String, ProvinceModel>> getProvinces() async {
    try {
      final url = Uri.parse('https://pro.rajaongkir.com/api/province');
      final response = await http.get(
        url,
        headers: {'key': RAJAONGKIR_KEY},
      );
      // print(response.body);
      if (response.statusCode == 200) {
        return right(ProvinceModel.fromJson(response.body));
      } else {
        return left('Error');
      }
    } catch (e) {
      return Left('Error: ' + e.toString());
    }
  }

  //city by province
  static Future<Either<String, CityModel>> getCitiesByProvince(
      String provinceId) async {
    final url =
        Uri.parse('https://pro.rajaongkir.com/api/city?province=$provinceId');
    final response = await http.get(
      url,
      headers: {
        'key': RAJAONGKIR_KEY,
      },
    );
    if (response.statusCode == 200) {
      return right(CityModel.fromJson(response.body));
    } else {
      return left('Error');
    }
  }

  //subdistrict(Kecamatan) by city
  static Future<Either<String, SubdistrictModel>> getSubdistrictsByCity(
      String cityId) async {
    final url =
        Uri.parse('https://pro.rajaongkir.com/api/subdistrict?city=$cityId');
    final response = await http.get(
      url,
      headers: {
        'key': RAJAONGKIR_KEY,
      },
    );
    // print('--Subdistrict');
    // print(response.body);
    if (response.statusCode == 200) {
      return right(SubdistrictModel.fromJson(response.body));
    } else {
      return left('Error');
    }
  }

  //--Get Shipping Cost by Subdistrict (Kecamatan):
  static Future<Either<String, ShippingCostModel>> getShippingCost(
      String origin, String destination, String courier) async {
    final url = Uri.parse('https://pro.rajaongkir.com/api/cost');
    final response = await http.post(
      url,
      headers: {
        'key': RAJAONGKIR_KEY,
      },
      body: {
        "origin": origin,
        "originType": "subdistrict",
        "destination": destination,
        "destinationType": "subdistrict",
        "weight": "1000",
        "courier": courier,
      },
    );
    // print('--getShippingCost');
    // print(response.body);
    if (response.statusCode == 200) {
      return right(ShippingCostModel.fromJson(response.body));
    } else {
      return left('Error');
    }
  }

  //--Get Data Couriers:
  // ========================================================================
  static Future<Either<String, List<String>>> getCouriers() async {
    try {
      final url = Uri.parse('https://pro.rajaongkir.com/api/province');
      final response = await http.get(
        url,
        headers: {'key': RAJAONGKIR_KEY},
      );
      // print(response.body);
      final couriers = jsonDecode(response.body)['rajaongkir']['results'];
      if (response.statusCode == 200) {
        return right(couriers);
      } else {
        return left('Error');
      }
    } catch (e) {
      return Left('Error: ' + e.toString());
    }
  }
}
