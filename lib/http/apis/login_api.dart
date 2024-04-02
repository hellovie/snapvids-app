import 'package:snapvids_app/common/models/graphical_captcha_model.dart';
import 'package:snapvids_app/common/models/login_model.dart';
import 'package:snapvids_app/common/models/token_model.dart';
import 'package:snapvids_app/http/request.dart';
import 'package:snapvids_app/http/result_response.dart';

class LoginApi {
  static Future<ResultResponse<LoginModel>> loginByUsername(
      String username, String password, String captchaId, String captcha) async {
    final res = await Request.post(
      '/login/username',
      data: {
        "username": username,
        "password": password,
        "captchaId": captchaId,
        "captcha": captcha
      },
    );
    final ResultResponse<LoginModel> result =
        ResultResponse.fromJson(res, dataFromJson: LoginModel.fromMap);
    return result;
  }

  static Future<ResultResponse<GraphicalCaptchaModel>> getGraphicalCaptcha() async {
    final res = await Request.get(
      '/login/username/captcha',
    );
    final ResultResponse<GraphicalCaptchaModel> result =
        ResultResponse.fromJson(res, dataFromJson: GraphicalCaptchaModel.fromMap);
    return result;
  }

  static Future<ResultResponse<TokenModel>> refreshToken() async {
    final res = await Request.get(
      '/tokens/refresh',
    );
    final ResultResponse<TokenModel> result =
        ResultResponse.fromJson(res, dataFromJson: TokenModel.fromMap);
    return result;
  }
}
