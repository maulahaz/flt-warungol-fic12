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
        headers: {
          'key': RAJAONGKIR_KEY,
        },
      );
      if (response.statusCode == 200) {
        return right(ProvinceModel.fromJson(response.body));
      } else {
        return left('Error');
      }
    } catch (e) {
      return Left('Error: ' + e.toString());
    }
  }
}
