import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:snapvids_app/common/config/common_colors.dart';
import 'package:snapvids_app/common/config/design_variables.dart';
import 'package:snapvids_app/common/utils/number_utils.dart';

class ActionBox extends StatelessWidget {
  final double width;
  final double height;
  final String iconAssetName;
  final bool isActive;
  final int count;
  final Function(bool)? onTap;

  const ActionBox({
    Key? key,
    required this.width,
    required this.height,
    required this.iconAssetName,
    this.isActive = false,
    this.count = 0,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const iconSize = DesignVariables.sizeExtraLarge;
    const iconFillColor = CommonColors.iconFill;

    return InkWell(
      onTap: () => onTap?.call(!isActive),
      child: SizedBox(
        width: width,
        height: height,
        child: Column(
          children: [
            SvgPicture.asset(
              iconAssetName,
              width: iconSize,
              height: iconSize,
              colorFilter: isActive ? null : const ColorFilter.mode(iconFillColor, BlendMode.srcIn),
            ),
            const Spacer(),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(text: NumberUtils.formatNumberWithChineseUnit(count.toDouble())),
            ),
          ],
        ),
      ),
    );
  }
}
