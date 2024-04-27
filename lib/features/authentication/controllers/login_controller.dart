import 'package:get/get.dart';
import 'package:snapvids_app/features/authentication/models/graphical_captcha_model.dart';
import 'package:snapvids_app/features/authentication/models/login_model.dart';
import 'package:snapvids_app/common/models/token_model.dart';
import 'package:snapvids_app/utils/http/http_request.dart';
import 'package:snapvids_app/utils/http/result_response.dart';

class LoginController extends GetxController {
  Future<ResultResponse<LoginModel>> loginByUsername(
      String username, String password, String captchaId, String captcha) async {
    final res = await HttpRequest.post(
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

  Future<ResultResponse<GraphicalCaptchaModel>> getGraphicalCaptcha() async {
    final res = await HttpRequest.get('/login/username/captcha');
    final ResultResponse<GraphicalCaptchaModel> result =
        ResultResponse.fromJson(res, dataFromJson: GraphicalCaptchaModel.fromMap);
    return result;
  }

  Future<ResultResponse<void>> logout() async {
    final res = await HttpRequest.get('/logout');
    final ResultResponse<TokenModel> result = ResultResponse.fromJson(res);
    return result;
  }
}
