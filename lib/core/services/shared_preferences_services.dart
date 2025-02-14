import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesServices {
  static Future<bool> checkIsVisitor() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    if (token == null) {
      return true;
    }
    return false;
  }

  static Future<void> setUserToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  static Future<String?> getUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');
    return token;
  }

  static Future<void> deleteUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
