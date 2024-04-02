import 'package:snapvids_app/common/models/token_model.dart';
import 'package:snapvids_app/common/utils/date_utils.dart';

import 'shared_preferences_store.dart';

class LoginStore {
  static bool isLogin() {
    int expiresInSeconds = SharedPreferencesStore.getExpiresInSeconds();
    String accessToken = SharedPreferencesStore.getAccessToken();
    String refreshToken = SharedPreferencesStore.getRefreshToken();
    if (accessToken == '' || refreshToken == '' || expiresInSeconds == 0) {
      return false;
    }

    final int now = DateUtils.getLocalTimestampInSeconds();
    return now < expiresInSeconds;
  }

  static void saveToken(TokenModel? tokenModel) {
    if (tokenModel != null) {
      SharedPreferencesStore.setAccessToken(tokenModel.accessToken);
      SharedPreferencesStore.setRefreshToken(tokenModel.refreshToken);
      SharedPreferencesStore.setExpiresInSeconds(tokenModel.expiresInSeconds);
    }
  }

  static void renewAccessTokenWithRefreshToken() {
    SharedPreferencesStore.setAccessToken(SharedPreferencesStore.getRefreshToken());
  }
}
