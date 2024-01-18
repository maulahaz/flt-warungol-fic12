import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../configs/x_configs.dart';
import '../models/x_models.dart';

class ProductServices {
  //--Get Data Product:
  // ========================================================================
  static Future<Either<String, ProductRemoteModel>> getProducts() async {
    var url = Uri.parse(BASE_URL + '/api/product');
    var response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );
    // print('==>getProducts ' + url.toString());
    // print(response.statusCode);
    // print(response.body);
    // var examData = jsonDecode(response.body)['data'];
    // print(examData);
    if (response.statusCode == 200) {
      return Right(ProductRemoteModel.fromJson(response.body));
    } else {
      return Left('Error on: getProducts');
    }
  }

  //--Get Data Product By Category:
  // ========================================================================
  static Future<Either<String, ProductRemoteModel>> getProductByCategory(
      int categoryId) async {
    var url = Uri.parse(BASE_URL + '/api/product?categoryId=$categoryId');
    var response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );
    // print('==>getProductByCategory ' + url.toString());
    // print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      return Right(ProductRemoteModel.fromJson(response.body));
    } else {
      return Left('Error on: getProductByCategory');
    }
  }
}
