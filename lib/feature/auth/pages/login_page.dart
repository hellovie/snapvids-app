import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snapvids_app/common/extension/custom_theme_extension.dart';
import 'package:snapvids_app/common/helper/show_alert_dialog.dart';
import 'package:snapvids_app/common/routes/routes.dart';
import 'package:snapvids_app/common/utils/coloors.dart';
import 'package:snapvids_app/common/widgets/custom_elevated_button.dart';
import 'package:snapvids_app/common/widgets/custom_icon_button.dart';
import 'package:snapvids_app/feature/auth/widgets/custom_text_field.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late TextEditingController countryNameController;
  late TextEditingController countryCodeController;
  late TextEditingController phoneNumberController;

  sendCodeToPhone() {
    final phoneNumber = phoneNumberController.text;
    final countryName = countryNameController.text;
    final countryCode = countryCodeController.text;

    if (countryCode != '86') {
      return showAlertDialog(
        context: context,
        message: '仅支持中国大陆的手机号码',
      );
    }

    if (phoneNumber.isEmpty) {
      return showAlertDialog(
        context: context,
        // message: 'Please enter your phone number',
        message: '请输入您的电话号码',
      );
    } else if (phoneNumber.length < 11) {
      return showAlertDialog(
        context: context,
        // message:
        //     "The phone number your entered is too short for the country: $countryName.\n\nInclude your area code if you haven't",
        message: '您输入的电话号码对于$countryName来说太短了。\n\n如果您还未包含，请添加您的区号。',
      );
    } else if (phoneNumber.length > 11) {
      return showAlertDialog(
        context: context,
        // message: 'The phone number you entered is too long for the country: $countryName',
        message: '您输入的电话号码对于$countryName来说太长了。',
      );
    }

    // Todo：发送短信验证码
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Routes.verification, (route) => false, arguments: {
      'smsCodeId': 'smsCodeId',
      'phoneNumber': phoneNumber,
    });
  }

  showCountryCodePicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      favorite: ['CN'],
      countryListTheme: CountryListThemeData(
        bottomSheetHeight: 600,
        backgroundColor: Theme.of(context).backgroundColor,
        flagSize: 22,
        borderRadius: BorderRadius.circular(20),
        textStyle: TextStyle(color: context.theme.greyColor),
        inputDecoration: InputDecoration(
          labelStyle: TextStyle(color: context.theme.greyColor),
          prefixIcon: const Icon(
            Icons.language,
            color: Coloors.redDark,
          ),
          // hintText: 'Search country code or name',
          hintText: '搜索国家/地区代码或名称',
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: context.theme.greyColor!.withOpacity(0.2),
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Coloors.redDark,
            ),
          ),
        ),
      ),
      onSelect: (country) {
        countryNameController.text = country.name;
        countryCodeController.text = country.phoneCode;
      },
    );
  }

  @override
  void initState() {
    countryNameController = TextEditingController(text: 'China');
    countryCodeController = TextEditingController(text: '86');
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    countryNameController.dispose();
    countryCodeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          // 'Enter your phone number',
          '输入您的电话号码',
          style: TextStyle(
            color: context.theme.authAppbarTextColor,
          ),
        ),
        centerTitle: true,
        actions: [
          CustomIconButton(
            onTap: () {},
            icon: Icons.more_vert,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                // text: 'Snapvids will need to verify you phone number. ',
                text: 'Snapvids 需要验证您的电话号码。',
                style: TextStyle(
                  color: context.theme.greyColor,
                  height: 1.5,
                ),
                // children: [
                //   TextSpan(
                //     // text: "What's my number?",
                //     text: "我的电话号码是多少？",
                //     style: TextStyle(
                //       color: context.theme.blueColor,
                //     ),
                //   ),
                // ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: CustomTextField(
              onTap: showCountryCodePicker,
              controller: countryNameController,
              readOnly: true,
              suffixIcon: const Icon(
                Icons.arrow_drop_down,
                color: Coloors.redDark,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              children: [
                SizedBox(
                  width: 70,
                  child: CustomTextField(
                    onTap: showCountryCodePicker,
                    controller: countryCodeController,
                    prefixText: '+',
                    readOnly: true,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextField(
                    onTap: () {},
                    controller: phoneNumberController,
                    // hintText: 'phone number',
                    hintText: '手机号码',
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            // 'Carrier charges may apply',
            '运营商可能会收取费用',
            style: TextStyle(
              color: context.theme.greyColor,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevatedButton(
        onPressed: sendCodeToPhone,
        // text: 'NEXT',
        text: '下一步',
        buttonWidth: 90,
      ),
    );
  }
}
