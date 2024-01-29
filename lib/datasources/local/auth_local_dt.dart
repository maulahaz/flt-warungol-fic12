import 'package:shared_preferences/shared_preferences.dart';

import '../../models/x_models.dart';

class AuthLocalData {
  //--
  // ========================================================================
  static Future<void> saveAuthData(AuthModel authResponseModel) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString('auth_data', authResponseModel.toJson());
  }

  //--
  // ========================================================================
  static Future<void> removeAuthData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('auth_data');
  }

  //--
  // ========================================================================
  static Future<AuthModel> getAuthData() async {
    final pref = await SharedPreferences.getInstance();
    final authData = pref.getString('auth_data');
    return AuthModel.fromJson(authData!);
  }

  //--
  // ========================================================================
  static Future<bool> isAuth() async {
    final pref = await SharedPreferences.getInstance();
    final authData = pref.getString('auth_data');
    if (authData != null) {
      return true;
    } else {
      return false;
    }
  }
}
