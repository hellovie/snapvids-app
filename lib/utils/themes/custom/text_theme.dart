import 'package:flutter/material.dart';
import 'package:snapvids_app/common/styles/font_styles.dart';
import 'package:snapvids_app/utils/constants/ui_colors.dart';

class SnapvidsTextTheme {
  SnapvidsTextTheme._();

  static final TextTheme lightTextTheme = TextTheme(
    displayLarge: FontStyles.displayLarge.copyWith(color: UiColors.textPrimaryLight),
    displayMedium: FontStyles.displayMedium.copyWith(color: UiColors.textPrimaryLight),
    displaySmall: FontStyles.displaySmall.copyWith(color: UiColors.textPrimaryLight),
    headlineLarge: FontStyles.headlineLarge.copyWith(color: UiColors.textPrimaryLight),
    headlineMedium: FontStyles.headlineMedium.copyWith(color: UiColors.textPrimaryLight),
    headlineSmall: FontStyles.headlineSmall.copyWith(color: UiColors.textPrimaryLight),
    titleLarge: FontStyles.titleLarge.copyWith(color: UiColors.textPrimaryLight),
    titleMedium: FontStyles.titleMedium.copyWith(color: UiColors.textPrimaryLight),
    titleSmall: FontStyles.titleSmall.copyWith(color: UiColors.textPrimaryLight),
    bodyLarge: FontStyles.bodyLarge.copyWith(color: UiColors.textPrimaryLight),
    bodyMedium: FontStyles.bodyMedium.copyWith(color: UiColors.textPrimaryLight),
    bodySmall: FontStyles.bodySmall.copyWith(color: UiColors.textPrimaryLight),
    labelLarge: FontStyles.labelLarge.copyWith(color: UiColors.textPrimaryLight),
    labelMedium: FontStyles.labelMedium.copyWith(color: UiColors.textPrimaryLight),
    labelSmall: FontStyles.labelSmall.copyWith(color: UiColors.textPrimaryLight),
  );

  static final TextTheme darkTextTheme = TextTheme(
    displayLarge: FontStyles.displayLarge.copyWith(color: UiColors.textPrimaryDark),
    displayMedium: FontStyles.displayMedium.copyWith(color: UiColors.textPrimaryDark),
    displaySmall: FontStyles.displaySmall.copyWith(color: UiColors.textPrimaryDark),
    headlineLarge: FontStyles.headlineLarge.copyWith(color: UiColors.textPrimaryDark),
    headlineMedium: FontStyles.headlineMedium.copyWith(color: UiColors.textPrimaryDark),
    headlineSmall: FontStyles.headlineSmall.copyWith(color: UiColors.textPrimaryDark),
    titleLarge: FontStyles.titleLarge.copyWith(color: UiColors.textPrimaryDark),
    titleMedium: FontStyles.titleMedium.copyWith(color: UiColors.textPrimaryDark),
    titleSmall: FontStyles.titleSmall.copyWith(color: UiColors.textPrimaryDark),
    bodyLarge: FontStyles.bodyLarge.copyWith(color: UiColors.textPrimaryDark),
    bodyMedium: FontStyles.bodyMedium.copyWith(color: UiColors.textPrimaryDark),
    bodySmall: FontStyles.bodySmall.copyWith(color: UiColors.textPrimaryDark),
    labelLarge: FontStyles.labelLarge.copyWith(color: UiColors.textPrimaryDark),
    labelMedium: FontStyles.labelMedium.copyWith(color: UiColors.textPrimaryDark),
    labelSmall: FontStyles.labelSmall.copyWith(color: UiColors.textPrimaryDark),
  );
}
