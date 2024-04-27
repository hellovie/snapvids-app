import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';
import 'package:snapvids_app/utils/constants/ui_texts.dart';
import 'package:snapvids_app/utils/helpers/toast_helper.dart';
import 'package:snapvids_app/utils/themes/extension/color_extension.dart';

class AgreeText extends StatelessWidget {
  const AgreeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: UiTexts.loginReadAndAgree,
            style: context.textTheme.bodyMedium!.copyWith(
              color: context.colorExtension.textSecondary,
            ),
          ),
          const WidgetSpan(child: SizedBox(width: UiSizes.xs)),
          TextSpan(
            text: UiTexts.loginUserAgreement,
            style: context.textTheme.bodyMedium!.copyWith(
              color: context.colorExtension.link,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                ToastHelper.show('敬请期待');
              },
          ),
          const WidgetSpan(child: SizedBox(width: UiSizes.xs)),
          TextSpan(
            text: UiTexts.loginAnd,
            style: context.textTheme.bodyMedium!.copyWith(
              color: context.colorExtension.textSecondary,
            ),
          ),
          const WidgetSpan(child: SizedBox(width: UiSizes.xs)),
          TextSpan(
            text: UiTexts.loginPrivacyPolicy,
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
    );
  }
}
