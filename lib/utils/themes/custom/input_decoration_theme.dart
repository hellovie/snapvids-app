import 'package:flutter/material.dart';
import 'package:snapvids_app/common/styles/font_styles.dart';
import 'package:snapvids_app/common/styles/spacing_styles.dart';
import 'package:snapvids_app/utils/constants/ui_colors.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';

class SnapvidsInputDecorationTheme {
  SnapvidsInputDecorationTheme._();

  static final InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    isDense: true,
    filled: true,
    fillColor: UiColors.inputFieldFillLight,
    prefixIconColor: UiColors.iconSecondaryLight,
    suffixIconColor: UiColors.iconSecondaryLight,
    contentPadding: SpacingStyles.inputFieldContentPadding,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(UiSizes.inputFieldPrimaryRadius),
      borderSide: BorderSide.none,
    ),
    hintStyle: FontStyles.inputFieldNormal.copyWith(color: UiColors.textDisabledLight),
  );

  static final InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    isDense: true,
    filled: true,
    fillColor: UiColors.inputFieldFillDark,
    prefixIconColor: UiColors.iconSecondaryDark,
    suffixIconColor: UiColors.iconSecondaryDark,
    contentPadding: SpacingStyles.inputFieldContentPadding,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(UiSizes.inputFieldPrimaryRadius),
      borderSide: BorderSide.none,
    ),
    hintStyle: FontStyles.inputFieldNormal.copyWith(color: UiColors.textDisabledDark),
  );
}
