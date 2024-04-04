import 'package:flutter/material.dart';
import 'package:snapvids_app/common/config/design_variables.dart';
import 'package:snapvids_app/common/routes/routes.dart';
import 'package:snapvids_app/common/widgets/input_form_field.dart';
import 'package:snapvids_app/common/widgets/phone_number_field.dart';
import 'package:snapvids_app/common/widgets/space.dart';
import 'package:snapvids_app/common/widgets/toast.dart';

class PhoneNumberLoginForm extends StatefulWidget {
  final bool isAgree;

  const PhoneNumberLoginForm({
    Key? key,
    required this.isAgree,
  }) : super(key: key);

  @override
  State<PhoneNumberLoginForm> createState() => _PhoneNumberLoginFormState();
}

class _PhoneNumberLoginFormState extends State<PhoneNumberLoginForm> {
  late TextEditingController countryCodeController;
  late TextEditingController phoneNumberController;
  late TextEditingController captchaController;

  Future<bool> _login() async {
    return false;
  }

  @override
  void initState() {
    countryCodeController = TextEditingController(text: '86');
    phoneNumberController = TextEditingController();
    captchaController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    countryCodeController.dispose();
    phoneNumberController.dispose();
    captchaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Space(
      direction: Axis.vertical,
      children: [
        PhoneNumberField(
          height: DesignVariables.inputHeightMedium,
          countryCodeController: countryCodeController,
          phoneNumberController: phoneNumberController,
          onChangedCountryCode: (country) {
            setState(() {
              phoneNumberController.clear();
              countryCodeController.text = country.phoneCode;
            });
          },
        ),
        Space(
          children: [
            Expanded(
              flex: 1,
              child: InputFormField(
                controller: captchaController,
                hintText: '请输入验证码',
                height: DesignVariables.inputHeightMedium,
              ),
            ),
            IntrinsicWidth(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(DesignVariables.inputHeightMedium),
                  maximumSize: const Size.fromHeight(DesignVariables.inputHeightMedium),
                ),
                onPressed: () {
                  Toast.show('暂未开通');
                },
                child: const Text('发送验证码'),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: widget.isAgree
                    ? () async {
                        _login().then((isLoginSuccess) {
                          Toast.show('敬请期待');
                          // if (isLoginSuccess) {
                          //   Toast.show('登录成功');
                          //   Navigator.of(context)
                          //       .pushNamedAndRemoveUntil(Routes.index, (route) => false);
                          // }
                        });
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(DesignVariables.inputHeightMedium),
                  maximumSize: const Size.fromHeight(DesignVariables.inputHeightMedium),
                ),
                child: const Text('验证并登录'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
