import 'package:snapvids_app/common/models/token_model.dart';
import 'package:snapvids_app/utils/helpers/date_helper.dart';
import 'package:snapvids_app/utils/storages/shared_preferences_utils.dart';

class LoginStorages {
  LoginStorages._();

  static const String _accessToken = 'access-token';
  static const String _refreshToken = 'refresh-token';
  static const String _expiresInSeconds = 'expires-in-seconds';

  static void saveToken(TokenModel? tokenModel) {
    if (tokenModel != null) {
      setAccessToken(tokenModel.accessToken);
      setRefreshToken(tokenModel.refreshToken);
      setExpiresInSeconds(tokenModel.expiresInSeconds);
    }
  }

  static void renewAccessTokenWithRefreshToken() {
    setAccessToken(getRefreshToken());
  }

  static void removeToken() {
    SharedPreferencesUtils.remove(_accessToken);
    SharedPreferencesUtils.remove(_refreshToken);
    SharedPreferencesUtils.remove(_expiresInSeconds);
  }

  static void setAccessToken(String accessToken) {
    SharedPreferencesUtils.saveString(_accessToken, accessToken);
  }

  static String getAccessToken() {
    return SharedPreferencesUtils.readString(_accessToken) ?? '';
  }

  static void setRefreshToken(String refreshToken) {
    SharedPreferencesUtils.saveString(_refreshToken, refreshToken);
  }

  static String getRefreshToken() {
    return SharedPreferencesUtils.readString(_refreshToken) ?? '';
  }

  static void setExpiresInSeconds(int expiresInSeconds) {
    SharedPreferencesUtils.saveInt(
        _expiresInSeconds, DateHelper.getLocalTimestampInSeconds() + expiresInSeconds);
  }

  static int getExpiresInSeconds() {
    return SharedPreferencesUtils.readInt(_expiresInSeconds) ?? 0;
  }
}
