import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static late SharedPreferences _preferences;
  static init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<bool> setString(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  String? getString(String key) {
    return _preferences.getString(key);
  }

  Future<bool> removePreference(String key) async {
    return await _preferences.remove(key);
  }
}
