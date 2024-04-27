import 'package:flutter/material.dart';
import 'package:snapvids_app/common/styles/font_styles.dart';
import 'package:snapvids_app/common/styles/spacing_styles.dart';
import 'package:snapvids_app/utils/constants/ui_colors.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';

class SnapvidsElevatedButtonTheme {
  SnapvidsElevatedButtonTheme._();

  static final ElevatedButtonThemeData lightElevatedButtonThemeTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: UiColors.elevatedButtonForeground,
      backgroundColor: UiColors.elevatedButtonBackground,
      disabledForegroundColor: UiColors.elevatedButtonForegroundDisabledLight,
      disabledBackgroundColor: UiColors.elevatedButtonBackgroundDisabledLight,
      side: const BorderSide(color: Colors.transparent, width: 0),
      padding: SpacingStyles.buttonContentPadding,
      textStyle: FontStyles.buttonNormal,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UiSizes.buttonRadius),
      ),
      splashFactory: NoSplash.splashFactory,
      shadowColor: Colors.transparent,
    ),
  );

  static final ElevatedButtonThemeData darkElevatedButtonThemeTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: UiColors.elevatedButtonForeground,
      backgroundColor: UiColors.elevatedButtonBackground,
      disabledForegroundColor: UiColors.elevatedButtonForegroundDisabledDark,
      disabledBackgroundColor: UiColors.elevatedButtonBackgroundDisabledDark,
      side: const BorderSide(color: Colors.transparent, width: 0),
      padding: SpacingStyles.buttonContentPadding,
      textStyle: FontStyles.buttonNormal,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UiSizes.buttonRadius),
      ),
      splashFactory: NoSplash.splashFactory,
      shadowColor: Colors.transparent,
    ),
  );
}
