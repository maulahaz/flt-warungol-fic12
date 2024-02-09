import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../configs/x_configs.dart';
import '../../models/x_models.dart';
import '../local/x_locals.dart';

class AddressRemoteData {
//
  //--Get Data:
  // ========================================================================
  static Future<Either<String, AddressModel>> getAddress() async {
    try {
      final authData = await AuthLocalData.getAuthData();
      var url = Uri.parse(BASE_URL + '/api/address');
      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authData.accessToken}',
      });
      if (response.statusCode == 200) {
        return Right(AddressModel.fromJson(response.body));
      } else {
        return Left('Fail while fetching data');
      }
    } catch (e) {
      return Left('Error: ' + e.toString());
    }
  }

  //--Add New Data:
  // ========================================================================
  static Future<Either<String, String>> addAddress(Address data) async {
    try {
      final authData = await AuthLocalData.getAuthData();
      var url = Uri.parse(BASE_URL + '/api/address');
      // print(data.toMap());
      var response = await http.post(url,
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${authData.accessToken}',
          },
          body: jsonEncode(data.toMap()));
      if (response.statusCode == 201) {
        return Right('Success');
      } else {
        return Left('Fail while saving data');
      }
    } catch (e) {
      return Left('Error: ' + e.toString());
    }
  }
}
