import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../configs/x_configs.dart';
import '../../models/x_models.dart';
import '../local/x_locals.dart';

class AuthRemoteData {
//
  //--Get Authorization Data:
  // ========================================================================
  static Future<Either<String, AuthModel>> signup(data) async {
    var url = Uri.parse(BASE_URL + '/api/register');
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Right(AuthModel.fromJson(response.body));
    } else {
      return Left('Register Fail');
    }
  }

  //--Signin:
  // ========================================================================
  static Future<Either<String, AuthModel>> signin(
      Map<String, String> loginData) async {
    try {
      // await Future.delayed(const Duration(seconds: 5));
      final response = await http.post(
        Uri.parse(BASE_URL + '/api/login'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(loginData),
      );
      print(loginData);
      print(jsonEncode(loginData));
      print(response.statusCode);
      if (response.statusCode == 200) {
        return Right(AuthModel.fromJson(response.body));
      } else {
        final responseBody = json.decode(response.body);
        return Left(responseBody['message']);
      }
    } catch (e) {
      return Left('Signin Failed: ' + e.toString());
    }
  }

  //--Signout:
  // ========================================================================
  static Future<Either<String, String>> signout() async {
    //--Get AccessToken before deleting AuthData:
    final authData = await AuthLocalData.getAuthData();
    final response = await http.post(
      Uri.parse('${BASE_URL}/api/logout'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ${authData.accessToken}',
      },
    );

    print(response.statusCode);
    if (response.statusCode == 200) {
      //--Remove Local AuthData:
      await AuthLocalData.removeAuthData();

      return const Right('Signout Success');
    } else {
      return const Left('Signout Fail');
    }
  }
}
