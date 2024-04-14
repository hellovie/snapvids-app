import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SLocalStorage {
  SLocalStorage._();

  static late SharedPreferences _prefs;

  static Future<bool> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _prefs = await SharedPreferences.getInstance();
    return true;
  }

  static Future<void> saveInt(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  static Future<void> saveString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  static Future<void> saveBool(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  static Future<void> saveDouble(String key, double value) async {
    await _prefs.setDouble(key, value);
  }

  static Future<void> saveStringList(String key, List<String> value) async {
    await _prefs.setStringList(key, value);
  }

  static int readInt(String key, {int defaultValue = 0}) {
    return _prefs.getInt(key) ?? defaultValue;
  }

  static String readString(String key, {String defaultValue = ''}) {
    return _prefs.getString(key) ?? defaultValue;
  }

  static bool readBool(String key, {bool defaultValue = false}) {
    return _prefs.getBool(key) ?? defaultValue;
  }

  static double readDouble(String key, {double defaultValue = 0.0}) {
    return _prefs.getDouble(key) ?? defaultValue;
  }

  static List<String> readStringList(String key, {List<String> defaultValue = const []}) {
    return _prefs.getStringList(key) ?? defaultValue;
  }

  static T? readData<T>(String key, {T? defaultValue}) {
    return _prefs.get(key) as T ?? defaultValue;
  }

  static Set<String> readKeys() {
    return _prefs.getKeys();
  }

  static Future<void> remove(String key) async {
    await _prefs.remove(key);
  }
  
  static Future<void> removeAll() async {
    await _prefs.clear();
  }
}
