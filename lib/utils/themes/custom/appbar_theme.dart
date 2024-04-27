import 'package:flutter/material.dart';
import 'package:snapvids_app/common/styles/font_styles.dart';
import 'package:snapvids_app/utils/constants/ui_colors.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';

class SnapvidsAppBarTheme {
  SnapvidsAppBarTheme._();

  static final lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: const IconThemeData(color: UiColors.iconPrimaryLight, size: UiSizes.iconMd),
    actionsIconTheme: const IconThemeData(color: UiColors.iconPrimaryLight, size: UiSizes.iconMd),
    titleTextStyle: FontStyles.titleLarge.copyWith(color: UiColors.textPrimaryLight),
  );

  static final darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: const IconThemeData(color: UiColors.iconPrimaryDark, size: UiSizes.iconMd),
    actionsIconTheme: const IconThemeData(color: UiColors.iconPrimaryDark, size: UiSizes.iconMd),
    titleTextStyle: FontStyles.titleLarge.copyWith(color: UiColors.textPrimaryDark),
  );
}
