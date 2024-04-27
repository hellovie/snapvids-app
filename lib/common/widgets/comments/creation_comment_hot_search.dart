import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';
import 'package:snapvids_app/utils/constants/ui_texts.dart';
import 'package:snapvids_app/utils/helpers/toast_helper.dart';
import 'package:snapvids_app/utils/themes/extension/color_extension.dart';

class CreationCommentHotSearch extends StatelessWidget {
  const CreationCommentHotSearch({
    super.key,
    required this.hotSearchKey,
  });

  final String hotSearchKey;

  @override
  Widget build(BuildContext context) {
    return hotSearchKey.isNotEmpty ? Padding(
      padding: const EdgeInsets.only(bottom: UiSizes.spaceBtwItems),
      child: Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: TextSpan(
            text: UiTexts.creationEveryoneIsSearchingFor,
            style: context.textTheme.labelMedium!.copyWith(
              color: context.colorExtension.textSecondary,
            ),
            children: [
              TextSpan(
                text: hotSearchKey,
                style: context.textTheme.labelMedium!.copyWith(
                  color: context.colorExtension.link,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => ToastHelper.show('敬请期待'),
              ),
              WidgetSpan(
                alignment: PlaceholderAlignment.top,
                child: Icon(
                  Iconsax.search_normal,
                  color: context.colorExtension.link,
                  size: UiSizes.iconMini,
                ),
              ),
            ],
          ),
        ),
      ),
    ) : const SizedBox();
  }
}
