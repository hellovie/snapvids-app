import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snapvids_app/common/styles/font_styles.dart';
import 'package:snapvids_app/common/widgets/comments/comment_bottom_sheet.dart';
import 'package:snapvids_app/common/widgets/common/gradient_color.dart';
import 'package:snapvids_app/utils/constants/image_assets.dart';
import 'package:snapvids_app/utils/constants/ui_colors.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';
import 'package:snapvids_app/utils/constants/ui_texts.dart';
import 'package:snapvids_app/utils/helpers/formatter_helper.dart';

class CreationCommentAction extends StatelessWidget {
  const CreationCommentAction({
    super.key,
    required this.count,
    required this.hotSearchKey,
  });

  final int count;
  final String hotSearchKey;

  @override
  Widget build(BuildContext context) {
    void openCommentBottomSheet() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(UiSizes.bottomSheetFullScreenRadius),
          ),
        ),
        builder: (context) {
          return CommentBottomSheet(
            count: count,
            hotSearchKey: hotSearchKey,
          );
        },
      );
    }

    return SizedBox(
      width: UiSizes.creationActionBoxWidth,
      height: UiSizes.creationActionBoxHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: openCommentBottomSheet,
            child: GradientColor(
              fillColor: UiColors.creationActionInactive,
              child: SvgPicture.asset(
                ImageAssets.comment,
                width: UiSizes.creationActionIcon,
                height: UiSizes.creationActionIcon,
              ),
            ),
          ),
          count <= 0
              ? Text(
                  UiTexts.creationZeroComment,
                  style: FontStyles.creationActionNormal,
                )
              : Text(
                  FormatterHelper.formatNumberWithLocalUnit(count.toDouble()),
                  style: FontStyles.creationActionNormal,
                ),
        ],
      ),
    );
  }
}
