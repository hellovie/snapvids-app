import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snapvids_app/common/styles/font_styles.dart';
import 'package:snapvids_app/common/widgets/common/gradient_color.dart';
import 'package:snapvids_app/common/widgets/shares/share_bottom_sheet.dart';
import 'package:snapvids_app/utils/constants/image_assets.dart';
import 'package:snapvids_app/utils/constants/ui_colors.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';
import 'package:snapvids_app/utils/constants/ui_texts.dart';
import 'package:snapvids_app/utils/helpers/formatter_helper.dart';

class CreationShareAction extends StatelessWidget {
  const CreationShareAction({
    super.key,
    required this.count,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    void openShareBottomSheet() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return const ShareBottomSheet();
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
            onTap: openShareBottomSheet,
            child: GradientColor(
              fillColor: UiColors.creationActionInactive,
              child: SvgPicture.asset(
                ImageAssets.share,
                width: UiSizes.creationActionIcon,
                height: UiSizes.creationActionIcon,
              ),
            ),
          ),
          count <= 0
              ? Text(
                  UiTexts.creationZeroShare,
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
