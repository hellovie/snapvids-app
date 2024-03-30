import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:snapvids_app/common/config/design_variables.dart';
import 'package:snapvids_app/common/models/graphical_captcha_model.dart';
import 'package:snapvids_app/common/models/login_model.dart';
import 'package:snapvids_app/common/widgets/input_form_field.dart';
import 'package:snapvids_app/common/widgets/space.dart';
import 'package:snapvids_app/http/apis/login_api.dart';

class UsernameLoginController {
  void Function() submit = () {};
}

class UsernameLoginForm extends StatefulWidget {
  final UsernameLoginController controller;

  const UsernameLoginForm({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<UsernameLoginForm> createState() => _UsernameLoginFormState(controller);
}

class _UsernameLoginFormState extends State<UsernameLoginForm> {
  _UsernameLoginFormState(UsernameLoginController controller) {
    controller.submit = _login;
  }

  late TextEditingController usernameController;
  late TextEditingController passwordController;
  late TextEditingController captchaController;
  String _captchaId = '';
  Uint8List _base64Captcha = base64Decode(captchaFetchFailPlaceHolder);
  late bool isLoadingCaptcha;

  void _getGraphicalCaptchaData() async {
    isLoadingCaptcha = true;
    try {
      GraphicalCaptchaModel result = await LoginApi.getGraphicalCaptcha();
      setState(() {
        _captchaId = result.captchaId;
        _base64Captcha = base64Decode(result.base64Captcha);
      });
    } on Exception catch (ex) {
      _captchaId = ex.toString();
      _base64Captcha = base64Decode(captchaFetchFailPlaceHolder);
    } finally {
      isLoadingCaptcha = false;
    }
  }

  _login() async {
    String username = usernameController.text;
    String password = passwordController.text;
    String captchaId = _captchaId;
    String captcha = captchaController.text;
    LoginModel result = await LoginApi.loginByUsername(username, password, captchaId, captcha);
    // Todo：临时
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(
            '欢迎你，${result.username}！',
          ),
        );
      },
    );
  }

  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    captchaController = TextEditingController();
    _getGraphicalCaptchaData();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    captchaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Space(
      direction: Axis.vertical,
      children: [
        InputFormField(
          controller: usernameController,
          hintText: '请输入用户名',
          height: DesignVariables.inputHeightMedium,
        ),
        InputFormField(
          controller: passwordController,
          obscureText: true,
          hintText: '请输入密码',
          height: DesignVariables.inputHeightMedium,
        ),
        Space(
          children: [
            Expanded(
              child: InputFormField(
                controller: captchaController,
                hintText: '请输入验证码',
                height: DesignVariables.inputHeightMedium,
              ),
            ),
            InkWell(
              onTap: _getGraphicalCaptchaData,
              child: SizedBox(
                height: DesignVariables.inputHeightMedium,
                child: Image.memory(_base64Captcha),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

const String captchaFetchFailPlaceHolder =
    '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';
