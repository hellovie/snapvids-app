import 'package:flutter/material.dart';
import 'package:snapvids_app/common/extension/custom_theme_extension.dart';

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    useMaterial3: true,
    extensions: [
      CustomThemeExtension.darkMode,
    ],
  );
}
