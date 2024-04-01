import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snapvids_app/common/config/common_colors.dart';
import 'package:snapvids_app/common/config/design_variables.dart';
import 'package:snapvids_app/common/extension/custom_theme_extension.dart';
import 'package:snapvids_app/common/widgets/space.dart';
import 'package:snapvids_app/common/widgets/toast.dart';
import 'package:snapvids_app/feature/login/widgets/username_login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isAgree = false;
  bool isPhoneNumberLogin = false;
  final UsernameLoginController usernameLoginController = UsernameLoginController();

  void _showOtherLoginPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(top: Radius.circular(DesignVariables.borderRadiusLarge)),
      ),
      builder: (context) {
        final double buttonWidth = MediaQuery.of(context).size.width;
        const double buttonHeight = 50;
        final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
          minimumSize: Size(buttonWidth, buttonHeight),
          maximumSize: Size(buttonWidth, buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(DesignVariables.borderRadiusNone),
          ),
        );
        const double buttonBorder = 1;

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              style: buttonStyle.copyWith(
                shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                  (Set<MaterialState> states) {
                    return const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(DesignVariables.borderRadiusLarge),
                      ),
                    );
                  },
                ),
              ),
              child: const Text('QQ 登录'),
              onPressed: () {},
            ),
            const Divider(height: buttonBorder),
            ElevatedButton(
              style: buttonStyle,
              child: const Text('微信登录'),
              onPressed: () {},
            ),
            const Divider(height: buttonBorder),
            ElevatedButton(
              style: buttonStyle,
              child: const Text('Google 登录'),
              onPressed: () {},
            ),
            const Space(direction: Axis.vertical, size: DesignVariables.spaceMedium),
            ElevatedButton(
              style: buttonStyle,
              child: const Text('取消'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const double horizontalPadding = DesignVariables.spaceLarge * 2;
    const double verticalPadding = DesignVariables.spaceLarger;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            margin: const EdgeInsets.all(DesignVariables.spaceMedium),
            child: const Icon(
              Icons.close_rounded,
              size: DesignVariables.sizeLarge,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: verticalPadding,
            ),
            child: Center(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      left: horizontalPadding,
                      right: horizontalPadding,
                      bottom: DesignVariables.spaceExtraLarge,
                    ),
                    child: const Text(
                      'Snapvids',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(
                      left: horizontalPadding,
                      right: horizontalPadding,
                    ),
                    child: const Text(
                      '登录发现更多精彩',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: horizontalPadding - 2,
                      right: horizontalPadding,
                      top: DesignVariables.spaceMini,
                      bottom: DesignVariables.spaceLarge,
                    ),
                    child: CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      value: isAgree,
                      onChanged: (value) {
                        setState(() {
                          isAgree = value ?? false;
                        });
                      },
                      title: RichText(
                        text: TextSpan(
                          style: const TextStyle(fontSize: 13),
                          children: [
                            TextSpan(
                              text: '已阅读并同意',
                              style: TextStyle(
                                color: context.theme.text_3,
                              ),
                            ),
                            const WidgetSpan(child: Space(size: DesignVariables.spaceSmall)),
                            TextSpan(
                              text: '用户协议',
                              style: const TextStyle(
                                color: CommonColors.link_4,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                            const WidgetSpan(child: Space(size: DesignVariables.spaceSmall)),
                            TextSpan(
                              text: '和',
                              style: TextStyle(
                                color: context.theme.text_3,
                              ),
                            ),
                            const WidgetSpan(child: Space(size: DesignVariables.spaceSmall)),
                            TextSpan(
                              text: '隐私政策',
                              style: const TextStyle(
                                color: CommonColors.link_4,
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: horizontalPadding,
                      right: horizontalPadding,
                    ),
                    child: isPhoneNumberLogin
                        ? Container()
                        : UsernameLoginForm(controller: usernameLoginController),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: horizontalPadding,
                      right: horizontalPadding,
                      top: DesignVariables.spaceLarger,
                      bottom: DesignVariables.spaceLarger,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: isAgree ? () async {
                              bool isLoginSuccess = await usernameLoginController.submit();
                              if (isLoginSuccess) {
                                Toast.show('登录成功');
                                Navigator.of(context).pop();
                              }
                            } : null,
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(DesignVariables.inputHeightMedium),
                              maximumSize: const Size.fromHeight(DesignVariables.inputHeightMedium),
                            ),
                            child: const Text('验证并登录'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: horizontalPadding,
                      right: horizontalPadding,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isPhoneNumberLogin = !isPhoneNumberLogin;
                            });
                          },
                          child: Text(
                            isPhoneNumberLogin ? '用户名登录' : '快捷登录',
                            style: const TextStyle(color: CommonColors.link_4),
                          ),
                        ),
                        InkWell(
                          onTap: () => _showOtherLoginPicker(context),
                          child: const Text(
                            '其他方式登录',
                            style: TextStyle(color: CommonColors.link_4),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(
                      left: horizontalPadding,
                      right: horizontalPadding,
                    ),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "手机号不用了？ ",
                        style: TextStyle(color: context.theme.text_3),
                        children: const [
                          TextSpan(
                            text: '找回账号',
                            style: TextStyle(color: CommonColors.link_4),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
