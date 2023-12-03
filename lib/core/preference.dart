import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;

  // ignore: unused_field, prefer_final_fields
  static String _token = '';

  static Future init() async {
    
    _prefs = await SharedPreferences.getInstance();
  }

  static String get token {
    return _prefs.getString('token') ?? _token;
  }

  static set token(String value) {
    _token = value;
    _prefs.setString('token', value);
  }
}
