import 'package:flutter/material.dart';
import 'package:snapvids_app/common/extension/custom_theme_extension.dart';
import 'package:snapvids_app/common/utils/coloors.dart';

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    backgroundColor: Coloors.backgroundDark,
    scaffoldBackgroundColor: Coloors.backgroundDark,
    // colorScheme: ColorScheme(
    // background: Coloors.backgroundLight,
    // brightness: null,
    // primary: null,
    // onPrimary: null,
    // secondary: null,
    // onSecondary: null,
    // error: null,
    // onError: null,
    // onBackground: null,
    // surface: null,
    // onSurface: null,
    // ),
    extensions: [
      CustomThemeExtension.darkMode,
    ],
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Coloors.redDark,
        foregroundColor: Coloors.backgroundDark,
        splashFactory: NoSplash.splashFactory,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
    ),
  );
}
