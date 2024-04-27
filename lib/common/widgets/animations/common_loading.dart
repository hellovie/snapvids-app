import 'package:flutter/material.dart';
import 'package:snapvids_app/common/widgets/animations/loading_animation.dart';
import 'package:snapvids_app/utils/constants/ui_colors.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';

class CommonLoading extends StatelessWidget {
  const CommonLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: UiSizes.loadingIndicator,
      height: UiSizes.loadingIndicator,
      decoration: BoxDecoration(
        color: UiColors.loadingIndicatorBackground,
        borderRadius: BorderRadius.circular(UiSizes.loadingIndicatorRadius),
      ),
      alignment: Alignment.center,
      child: const LoadingAnimation(),
    );
  }
}
