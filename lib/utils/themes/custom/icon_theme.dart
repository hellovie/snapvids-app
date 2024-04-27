import 'package:flutter/cupertino.dart';
import 'package:snapvids_app/utils/constants/ui_colors.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';

class SnapvidsIconTheme {
  SnapvidsIconTheme._();

  static const IconThemeData lightIconTheme =  IconThemeData(
    size: UiSizes.iconMd,
    color: UiColors.iconPrimaryLight,
  );

  static const IconThemeData darkIconTheme = IconThemeData(
    size: UiSizes.iconMd,
    color: UiColors.iconPrimaryDark,
  );
}