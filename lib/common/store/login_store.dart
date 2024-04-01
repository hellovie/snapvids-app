import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginStore {
  static const String _accessToken = 'access-token';
  static const String _refreshToken = 'refresh-token';
  static const String _expiresInSeconds = 'expires-in-seconds';

  static late SharedPreferences _prefs;

  static Future<bool> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    _prefs = await SharedPreferences.getInstance();
    return true;
  }

  static bool isLogin() {
    int expiresInSeconds = getExpiresInSeconds();
    String accessToken = getAccessToken();
    String refreshToken = getRefreshToken();
    if (accessToken == '' || refreshToken == '' || expiresInSeconds == 0) {
      return false;
    }

    final int now = _getLocalTimestampInSeconds();
    return now < expiresInSeconds;
  }

  static void saveLoginInfo(String accessToken, String refreshToken, int expiresInSeconds) {
    setAccessToken(accessToken);
    setRefreshToken(refreshToken);
    setExpiresInSeconds(expiresInSeconds);
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
    _prefs.setInt(_expiresInSeconds, _getLocalTimestampInSeconds() + expiresInSeconds);
  }

  static int getExpiresInSeconds() {
    return _prefs.getInt(_expiresInSeconds) ?? 0;
  }

  static int _getLocalTimestampInSeconds() {
    return DateTime.now().millisecondsSinceEpoch ~/ 1000;
  }
}
