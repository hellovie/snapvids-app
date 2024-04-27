import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapvids_app/common/styles/spacing_styles.dart';
import 'package:snapvids_app/features/authentication/screens/login/widgets/agree_text.dart';
import 'package:snapvids_app/features/authentication/screens/login/widgets/other_login_ways_button.dart';
import 'package:snapvids_app/features/authentication/screens/login/widgets/password_login_form.dart';
import 'package:snapvids_app/features/authentication/screens/login/widgets/quick_login_form.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';
import 'package:snapvids_app/utils/constants/ui_texts.dart';
import 'package:snapvids_app/utils/helpers/toast_helper.dart';
import 'package:snapvids_app/utils/themes/extension/color_extension.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Rx<bool> isAgree = false.obs;
    final Rx<bool> isQuickLogin = false.obs;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            CupertinoIcons.clear,
            color: context.colorExtension.iconPrimary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: SpacingStyles.paddingWithZeroTop,
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  UiTexts.appName,
                  style: context.textTheme.displayMedium,
                ),
              ),
              const SizedBox(height: UiSizes.spaceBtwSections),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  UiTexts.loginSignInToFindOutMore,
                  style: context.textTheme.titleLarge,
                ),
              ),
              Obx(
                () => Material(
                  child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    value: isAgree.value,
                    onChanged: (active) {
                      isAgree.value = active ?? false;
                    },
                    title: const AgreeText(),
                  ),
                ),
              ),
              const SizedBox(height: UiSizes.spaceBtwInputFields / 2),
              Obx(
                () => isQuickLogin.value
                    ? QuickLoginForm(isAgree: isAgree)
                    : PasswordLoginForm(isAgree: isAgree),
              ),
              const SizedBox(height: UiSizes.spaceBtwInputFields / 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => isQuickLogin.value = !isQuickLogin.value,
                    child: Obx(
                      () => Text(
                        isQuickLogin.value ? UiTexts.loginPasswordLogin : UiTexts.loginQuickLogin,
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: context.colorExtension.link,
                        ),
                      ),
                    ),
                  ),
                  OtherLoginWaysButton(isAgree: isAgree),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(UiSizes.defaultSpace),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: UiTexts.loginPhoneNumberNotInUse,
            style: context.textTheme.bodyMedium!.copyWith(
              color: context.colorExtension.textSecondary,
            ),
            children: [
              const WidgetSpan(child: SizedBox(width: UiSizes.xs)),
              TextSpan(
                text: UiTexts.loginAccountRecovery,
                style: context.textTheme.bodyMedium!.copyWith(
                  color: context.colorExtension.link,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    ToastHelper.show('敬请期待');
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
