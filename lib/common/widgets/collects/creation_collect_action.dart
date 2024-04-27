import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snapvids_app/common/styles/font_styles.dart';
import 'package:snapvids_app/common/widgets/common/gradient_color.dart';
import 'package:snapvids_app/utils/constants/image_assets.dart';
import 'package:snapvids_app/utils/constants/ui_colors.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';
import 'package:snapvids_app/utils/constants/ui_texts.dart';
import 'package:snapvids_app/utils/helpers/formatter_helper.dart';

class CreationCollectAction extends StatelessWidget {
  const CreationCollectAction({
    super.key,
    required this.isCollected,
    required this.count,
    required this.onCollected,
  });

  final bool isCollected;
  final int count;
  final Function(bool, int) onCollected;

  @override
  Widget build(BuildContext context) {
    void handleCollectEvent() {
      final bool curIsCollected = !isCollected;
      final int curCount = curIsCollected ? count + 1 : count - 1;
      onCollected(curIsCollected, curCount);
    }

    return SizedBox(
      width: UiSizes.creationActionBoxWidth,
      height: UiSizes.creationActionBoxHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: handleCollectEvent,
            child: isCollected
                ? GradientColor(
                    fillColor: UiColors.creationActionCollected,
                    child: SvgPicture.asset(
                      ImageAssets.collect,
                      width: UiSizes.creationActionIcon,
                      height: UiSizes.creationActionIcon,
                    ),
                  )
                : GradientColor(
                    fillColor: UiColors.creationActionInactive,
                    child: SvgPicture.asset(
                      ImageAssets.collect,
                      width: UiSizes.creationActionIcon,
                      height: UiSizes.creationActionIcon,
                    ),
                  ),
          ),
          count <= 0
              ? Text(
                  UiTexts.creationZeroCollect,
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
