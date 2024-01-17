import 'package:shared_preferences/shared_preferences.dart';

class MySessions {
  static Future<void> saveAccessFirstTime() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool('is_first_time', true);
  }

  static Future<bool> isAccessFirstTime() async {
    final pref = await SharedPreferences.getInstance();
    final isFirstTime = pref.getBool('is_first_time');

    return isFirstTime ?? false;
  }

  static Future<bool> setLoggedIn(bool status) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool("logged_in", status);
  }

  static Future<bool> getLogedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("logged_in") ?? false;
  }

  static Future<bool> setUserId(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("user_id", userId);
  }

  static Future<String> getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("user_id") ?? '';
  }

  //--
  // ========================================================================
  // static Future<void> saveAuthData(AuthorizationModel authResponseModel) async {
  //   final pref = await SharedPreferences.getInstance();
  //   await pref.setString('auth_data', authResponseModel.toJson());
  // }

  //--
  // ========================================================================
  static Future<void> removeAuthData() async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('auth_data');
  }
}
