import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapvids_app/common/widgets/comments/creation_comment_hot_search.dart';
import 'package:snapvids_app/common/widgets/common/space.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';
import 'package:snapvids_app/utils/constants/ui_texts.dart';
import 'package:snapvids_app/utils/devices/device_utils.dart';
import 'package:snapvids_app/utils/helpers/formatter_helper.dart';
import 'package:snapvids_app/utils/helpers/toast_helper.dart';
import 'package:snapvids_app/utils/themes/extension/color_extension.dart';

const double actionIconSize = UiSizes.iconSm;
const double actionIconBtwSpace = UiSizes.spaceBtwItems;
const int actionNum = 2;
const double actionsWidth = actionNum * (actionIconSize + actionIconBtwSpace);

class CommentBottomSheet extends StatelessWidget {
  const CommentBottomSheet({
    super.key,
    required this.count,
    required this.hotSearchKey,
  });

  final int count;
  final String hotSearchKey;

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = DeviceUtils.getStatusBarHeight();
    final double width = DeviceUtils.getScreenWidth();
    final double fullScreenHeight = DeviceUtils.getScreenHeight() - statusBarHeight;
    final double adjustedHeight = ((fullScreenHeight - statusBarHeight) / 3 * 2);
    final Rx<double> curHeight = adjustedHeight.obs;
    final Rx<bool> isFullscreen = false.obs;

    void onFullScreenBtnClick() {
      isFullscreen.value = !isFullscreen.value;
      curHeight.value = isFullscreen.value ? fullScreenHeight : adjustedHeight;
    }

    return Obx(
      () => SizedBox(
        width: width,
        height: curHeight.value,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: UiSizes.md,
                bottom: UiSizes.sm,
                left: UiSizes.md,
                right: UiSizes.md,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        CreationCommentHotSearch(hotSearchKey: hotSearchKey),
                        Padding(
                          padding: const EdgeInsets.only(left: actionsWidth),
                          child: Text(
                            '${FormatterHelper.formatNumberWithLocalUnit(count.toDouble())}${UiTexts.creationHowManyComments}',
                            style: context.textTheme.labelSmall,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: actionsWidth,
                    child: SizedBox(
                      child: Space(
                        size: actionIconBtwSpace,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: onFullScreenBtnClick,
                            child: Icon(
                              isFullscreen.value
                                  ? CupertinoIcons.fullscreen_exit
                                  : CupertinoIcons.fullscreen,
                              color: context.colorExtension.iconSecondary,
                              size: actionIconSize,
                            ),
                          ),
                          InkWell(
                            onTap: () => Get.back(),
                            child: Icon(
                              CupertinoIcons.clear,
                              color: context.colorExtension.iconSecondary,
                              size: actionIconSize,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: UiSizes.md),
                child: Center(
                  child: Text(
                    '暂不支持评论作品',
                    style: context.textTheme.titleMedium!.copyWith(
                      color: context.colorExtension.textPrimary,
                    ),
                  ),
                ),
              ),
            ),
            Divider(
              height: UiSizes.dividerPrimaryHeight,
              thickness: UiSizes.dividerPrimaryThickness,
              color: context.colorExtension.borderPrimary,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: UiSizes.sm, horizontal: UiSizes.md),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: UiTexts.creationCommentInputFieldHint,
                  suffixIconConstraints: const BoxConstraints(
                    maxHeight: UiSizes.inputFieldSecondaryHeight,
                    minHeight: UiSizes.inputFieldSecondaryHeight,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(UiSizes.inputFieldSecondaryRadius),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IntrinsicWidth(
                    child: Space(
                      size: UiSizes.sm,
                      padding: const EdgeInsets.symmetric(
                        horizontal: UiSizes.inputFieldHorizontalPadding,
                      ),
                      children: [
                        InkWell(
                          onTap: () => ToastHelper.show('敬请期待'),
                          child: const Icon(CupertinoIcons.at),
                        ),
                        InkWell(
                          onTap: () => ToastHelper.show('敬请期待'),
                          child: const Icon(CupertinoIcons.smiley),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
