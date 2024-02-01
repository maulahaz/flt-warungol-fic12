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
      print(response.body);
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
    print('--Subdistrict');
    print(response.body);
    if (response.statusCode == 200) {
      return right(SubdistrictModel.fromJson(response.body));
    } else {
      return left('Error');
    }
  }
}
