import 'package:flutter/cupertino.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';

class SpacingStyles {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: UiSizes.appBarHeight,
    right: UiSizes.defaultSpace,
    bottom: UiSizes.defaultSpace,
    left: UiSizes.defaultSpace,
  );

  static const EdgeInsetsGeometry paddingWithZeroTop = EdgeInsets.only(
    top: 0,
    right: UiSizes.defaultSpace,
    bottom: UiSizes.defaultSpace,
    left: UiSizes.defaultSpace,
  );

  static const EdgeInsetsGeometry buttonContentPadding = EdgeInsets.symmetric(
    horizontal: UiSizes.buttonHorizontalPadding,
    vertical: UiSizes.buttonVerticalPadding,
  );

  static const EdgeInsetsGeometry inputFieldContentPadding = EdgeInsets.symmetric(
    horizontal: UiSizes.inputFieldHorizontalPadding,
    vertical: UiSizes.inputFieldVerticalPadding,
  );
}
