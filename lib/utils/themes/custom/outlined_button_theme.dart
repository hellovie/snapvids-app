import 'package:flutter/material.dart';
import 'package:snapvids_app/common/styles/font_styles.dart';
import 'package:snapvids_app/common/styles/spacing_styles.dart';
import 'package:snapvids_app/utils/constants/ui_colors.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';

class SnapvidsOutlinedButtonTheme {
  SnapvidsOutlinedButtonTheme._();

  static final OutlinedButtonThemeData lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.resolveWith<double>((Set<MaterialState> states) {
        return 0;
      }),
      foregroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled) || states.contains(MaterialState.pressed)) {
          return UiColors.outlinedButtonForegroundDisabledLight;
        }
        return UiColors.outlinedButtonForegroundLight;
      }),
      backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        return UiColors.outlinedButtonBackground;
      }),
      overlayColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        return Colors.transparent;
      }),
      side: MaterialStateProperty.resolveWith<BorderSide>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled) || states.contains(MaterialState.pressed)) {
          return BorderSide(color: UiColors.outlinedButtonForegroundDisabledLight, width: 1);
        }
        return const BorderSide(color: UiColors.outlinedButtonForegroundLight, width: 1);
      }),
      shadowColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        return Colors.transparent;
      }),
      padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>((Set<MaterialState> states) {
        return SpacingStyles.buttonContentPadding;
      }),
      textStyle: MaterialStateProperty.resolveWith<TextStyle>((Set<MaterialState> states) {
        return FontStyles.buttonNormal;
      }),
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>((Set<MaterialState> states) {
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(UiSizes.buttonRadius));
      }),
      splashFactory: NoSplash.splashFactory,
    ),
  );

  static final OutlinedButtonThemeData darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: ButtonStyle(
      elevation: MaterialStateProperty.resolveWith<double>((Set<MaterialState> states) {
        return 0;
      }),
      foregroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled) || states.contains(MaterialState.pressed)) {
          return UiColors.outlinedButtonForegroundDisabledDark;
        }
        return UiColors.outlinedButtonForegroundDark;
      }),
      backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        return UiColors.outlinedButtonBackground;
      }),
      overlayColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        return Colors.transparent;
      }),
      side: MaterialStateProperty.resolveWith<BorderSide>((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled) || states.contains(MaterialState.pressed)) {
          return BorderSide(color: UiColors.outlinedButtonForegroundDisabledDark, width: 1);
        }
        return const BorderSide(color: UiColors.outlinedButtonForegroundDark, width: 1);
      }),
      shadowColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        return Colors.transparent;
      }),
      padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>((Set<MaterialState> states) {
        return SpacingStyles.buttonContentPadding;
      }),
      textStyle: MaterialStateProperty.resolveWith<TextStyle>((Set<MaterialState> states) {
        return FontStyles.buttonNormal;
      }),
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>((Set<MaterialState> states) {
        return RoundedRectangleBorder(borderRadius: BorderRadius.circular(UiSizes.buttonRadius));
      }),
      splashFactory: NoSplash.splashFactory,
    ),
  );
}
