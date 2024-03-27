import 'package:flutter/material.dart';
import 'package:snapvids_app/common/extension/custom_theme_extension.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    useMaterial3: true,
    extensions: [
      CustomThemeExtension.lightMode,
    ],
  );
}
