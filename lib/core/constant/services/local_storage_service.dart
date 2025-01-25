import 'package:shared_preferences/shared_preferences.dart';

 abstract class LocalStorage {
  static late SharedPreferences _preferences;


  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

   static Future<bool> setString(String key, String value) async {
    return await _preferences.setString(key, value);
  }


   static Future<bool> setInt(String key, int value) async {
    return await _preferences.setInt(key, value);
  }


   static Future<bool> setBool(String key, bool value) async {
    return await _preferences.setBool(key, value);
  }
   static String? getString(String key) {
    return _preferences.getString(key);
  }

  static bool? getBool(String key) {
    return _preferences.getBool(key);
  }


   static int? getInt(String key) {
    return _preferences.getInt(key);
  }
}

  
