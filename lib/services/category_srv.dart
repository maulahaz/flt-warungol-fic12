import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../configs/x_configs.dart';
import '../models/x_models.dart';

class CategoryServices {
  //--Get Data Category:
  // ========================================================================
  static Future<Either<String, CategoryModel>> getCategories() async {
    var url = Uri.parse(BASE_URL + 'category');
    var response = await http.get(
      url,
      headers: {'Content-Type': 'application/json'},
    );
    print('==>getCategories ' + url.toString());
    print(response.statusCode);
    print(response.body);
    // var examData = jsonDecode(response.body)['data'];
    // print(examData);
    if (response.statusCode == 200) {
      return Right(CategoryModel.fromJson(response.body));
    } else {
      return Left('Error on: getCategories');
    }
  }
}
