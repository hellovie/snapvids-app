import 'package:snapvids_app/common/models/graphical_captcha_model.dart';
import 'package:snapvids_app/common/models/login_model.dart';
import 'package:snapvids_app/http/request.dart';
import 'package:snapvids_app/http/result_response.dart';

class LoginApi {
  static Future<LoginModel> loginByUsername(
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
    final result = ResultResponse.fromJson(res, dataFromJson: LoginModel.fromMap);
    return result.data as LoginModel;
  }

  static Future<GraphicalCaptchaModel> getGraphicalCaptcha() async {
    final res = await Request.get(
      '/login/username/captcha',
    );
    final result = ResultResponse.fromJson(res, dataFromJson: GraphicalCaptchaModel.fromMap);
    return result.data as GraphicalCaptchaModel;
  }
}
