import 'package:shared_preferences/shared_preferences.dart';

// ignore: constant_identifier_names
const String TOKEN = "TOKEN";

class SharedPreferencesServices {
  static Future<bool> checkIsVisitor() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString(TOKEN);
    if (token == null) {
      return true;
    }
    return false;
  }

  static Future<void> setUserToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(TOKEN, token);
  }

  static Future<String?> getUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString(TOKEN);
    return token;
  }

  static Future<void> deleteUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
