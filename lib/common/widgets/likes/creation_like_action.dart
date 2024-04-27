import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snapvids_app/common/styles/font_styles.dart';
import 'package:snapvids_app/common/widgets/common/gradient_color.dart';
import 'package:snapvids_app/utils/constants/image_assets.dart';
import 'package:snapvids_app/utils/constants/ui_colors.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';
import 'package:snapvids_app/utils/constants/ui_texts.dart';
import 'package:snapvids_app/utils/helpers/formatter_helper.dart';

class CreationLikeAction extends StatelessWidget {
  const CreationLikeAction({
    super.key,
    required this.isLiked,
    required this.count,
    required this.onLiked,
  });

  final bool isLiked;
  final int count;
  final Function(bool, int) onLiked;

  @override
  Widget build(BuildContext context) {
    void handleLikeEvent() {
      final bool curIsLiked = !isLiked;
      final int curCount = curIsLiked ? count + 1 : count - 1;
      onLiked(curIsLiked, curCount);
    }

    return SizedBox(
      width: UiSizes.creationActionBoxWidth,
      height: UiSizes.creationActionBoxHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: handleLikeEvent,
            child: isLiked
                ? GradientColor(
                    fillColor: UiColors.creationActionLiked,
                    child: SvgPicture.asset(
                      ImageAssets.like,
                      width: UiSizes.creationActionIcon,
                      height: UiSizes.creationActionIcon,
                    ),
                  )
                : GradientColor(
                    fillColor: UiColors.creationActionInactive,
                    child: SvgPicture.asset(
                      ImageAssets.like,
                      width: UiSizes.creationActionIcon,
                      height: UiSizes.creationActionIcon,
                    ),
                  ),
          ),
          count <= 0
              ? Text(
                  UiTexts.creationZeroLike,
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
