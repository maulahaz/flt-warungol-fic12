import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../configs/x_configs.dart';
import '../../models/x_models.dart';

class WarungRemoteData {
//
  //--Get Data:
  // ========================================================================
  static Future<Either<String, WarungListModel>> getWarung() async {
    try {
      var url = Uri.parse(BASE_URL + '/api/warung');
      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        // final dataWarung = jsonDecode(response.body)['data'];
        return Right(WarungListModel.fromJson(response.body));
      } else {
        return Left('Fail while fetching data');
      }
    } catch (e) {
      return Left('Error: ' + e.toString());
    }
  }
}
