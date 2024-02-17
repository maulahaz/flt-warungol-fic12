import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../configs/x_configs.dart';
import '../../models/x_models.dart';
import '../local/x_locals.dart';

class OrderRemoteData {
//
  //--Make Order:
  // ========================================================================
  static Future<Either<String, OrderModel>> makeOrder(
      OrderRequestModel orderRequestModel) async {
    try {
      final authData = await AuthLocalData.getAuthData();
      var url = Uri.parse(BASE_URL + '/api/make-order');
      var response = await http.post(
        url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${authData.accessToken}',
        },
        body: json.encode(orderRequestModel.toMap()),
      );
      print(orderRequestModel.paymentMethod);
      print(response.body);
      if (response.statusCode == 200) {
        return Right(OrderModel.fromJson(response.body));
      } else {
        return Left('Fail while fetching data');
      }
    } catch (e) {
      return Left('Error: ' + e.toString());
    }
  }

  //--Get Order Status:
  // ========================================================================
  static Future<Either<String, String>> getOrderStatus(int orderId) async {
    try {
      final authData = await AuthLocalData.getAuthData();
      var url = Uri.parse(BASE_URL + '/api/order/status/$orderId');
      var response = await http.get(url, headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authData.accessToken}',
      });
      print(response.body);
      final status = jsonDecode(response.body)['status'];
      print(status);
      if (response.statusCode == 200) {
        return Right(status);
      } else {
        return Left('Fail while fetching data');
      }
    } catch (e) {
      return Left('Error: ' + e.toString());
    }
  }
}
