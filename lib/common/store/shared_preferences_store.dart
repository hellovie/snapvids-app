import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snapvids_app/common/utils/date_utils.dart';

class SharedPreferencesStore {
  static const String _accessToken = 'access-token';
  static const String _refreshToken = 'refresh-token';
  static const String _expiresInSeconds = 'expires-in-seconds';

  static late SharedPreferences _prefs;

  static Future<bool> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _prefs = await SharedPreferences.getInstance();
    return true;
  }

  static void setAccessToken(String accessToken) {
    _prefs.setString(_accessToken, accessToken);
  }

  static String getAccessToken() {
    return _prefs.getString(_accessToken) ?? '';
  }

  static void setRefreshToken(String refreshToken) {
    _prefs.setString(_refreshToken, refreshToken);
  }

  static String getRefreshToken() {
    return _prefs.getString(_refreshToken) ?? '';
  }

  static void setExpiresInSeconds(int expiresInSeconds) {
    _prefs.setInt(_expiresInSeconds, DateUtils.getLocalTimestampInSeconds() + expiresInSeconds);
  }

  static int getExpiresInSeconds() {
    return _prefs.getInt(_expiresInSeconds) ?? 0;
  }
}
