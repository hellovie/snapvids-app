import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapvids_app/common/widgets/common/space.dart';
import 'package:snapvids_app/features/authentication/screens/login/widgets/agree_text.dart';
import 'package:snapvids_app/utils/constants/image_assets.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';
import 'package:snapvids_app/utils/constants/ui_texts.dart';
import 'package:snapvids_app/utils/helpers/toast_helper.dart';
import 'package:snapvids_app/utils/themes/extension/color_extension.dart';

class OtherLoginWaysButton extends StatelessWidget {
  const OtherLoginWaysButton({
    super.key,
    required this.isAgree,
  });

  final Rx<bool> isAgree;

  @override
  Widget build(BuildContext context) {
    void showOtherLoginWaysBottomSheet(BuildContext context) {
      ButtonStyle buttonStyle = OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.transparent, width: 0),
      );
      Divider thinDivider = Divider(
        height: UiSizes.dividerPrimaryHeight,
        thickness: UiSizes.dividerPrimaryThickness,
        color: context.colorExtension.borderPrimary,
      );
      Divider thickDivider = Divider(
        height: UiSizes.dividerPrimaryHeight,
        thickness: UiSizes.sm,
        color: context.colorExtension.borderPrimary!.withOpacity(0.3),
      );
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return IntrinsicHeight(
            child: Space(
              size: 0,
              direction: Axis.vertical,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: IntrinsicHeight(
                    child: OutlinedButton(
                      onPressed: () => ToastHelper.show('敬请期待'),
                      style: buttonStyle,
                      child: Space(
                        mainAxisAlignment: MainAxisAlignment.center,
                        size: UiSizes.sm,
                        children: [
                          Image.asset(
                              width: UiSizes.iconMd, height: UiSizes.iconMd, ImageAssets.wechat),
                          const Text(UiTexts.socialWechat),
                        ],
                      ),
                    ),
                  ),
                ),
                thinDivider,
                SizedBox(
                  width: double.infinity,
                  child: IntrinsicHeight(
                    child: OutlinedButton(
                      onPressed: () => ToastHelper.show('敬请期待'),
                      style: buttonStyle,
                      child: Space(
                        mainAxisAlignment: MainAxisAlignment.center,
                        size: UiSizes.sm,
                        children: [
                          Image.asset(
                              width: UiSizes.iconMd, height: UiSizes.iconMd, ImageAssets.tiktok),
                          const Text(UiTexts.socialTiktok),
                        ],
                      ),
                    ),
                  ),
                ),
                thinDivider,
                SizedBox(
                  width: double.infinity,
                  child: IntrinsicHeight(
                    child: OutlinedButton(
                      onPressed: () => ToastHelper.show('敬请期待'),
                      style: buttonStyle,
                      child: Space(
                        mainAxisAlignment: MainAxisAlignment.center,
                        size: UiSizes.sm,
                        children: [
                          Image.asset(
                              width: UiSizes.iconMd, height: UiSizes.iconMd, ImageAssets.google),
                          const Text(UiTexts.socialGoogle),
                        ],
                      ),
                    ),
                  ),
                ),
                thickDivider,
                SizedBox(
                  width: double.infinity,
                  child: IntrinsicHeight(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      style: buttonStyle,
                      child: const Text(UiTexts.loginCancelOtherWaysToLogin),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    void showOtherLoginWaysAlertDialog() {
      showDialog(
        barrierDismissible: false,
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              UiTexts.loginUserAgreementAndPrivacyPolicy,
              textAlign: TextAlign.center,
              style: context.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            content: IntrinsicHeight(
              child: Space(
                size: UiSizes.sm,
                direction: Axis.vertical,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: AgreeText(),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      UiTexts.loginWeKeepYourPersonalInfoSecure,
                      style: context.textTheme.labelMedium!.copyWith(
                        color: context.colorExtension.textSecondary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                        isAgree.value = true;
                        showOtherLoginWaysBottomSheet(context);
                      },
                      child: const Text(UiTexts.loginAgreeAndLogin),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.back(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: UiSizes.sm),
                      child: Text(
                        UiTexts.loginDisagreeLogin,
                        style: context.textTheme.labelMedium!.copyWith(
                          color: context.colorExtension.textSecondary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return InkWell(
      onTap: () {
        isAgree.value ? showOtherLoginWaysBottomSheet(context) : showOtherLoginWaysAlertDialog();
      },
      child: Text(
        UiTexts.loginOtherWaysToLogin,
        style: context.textTheme.bodyMedium!.copyWith(
          color: context.colorExtension.link,
        ),
      ),
    );
  }
}
