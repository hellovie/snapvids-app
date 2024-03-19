import 'package:flutter/material.dart';
import 'package:snapvids_app/common/extension/custom_theme_extension.dart';
import 'package:snapvids_app/common/utils/coloors.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    backgroundColor: Coloors.backgroundLight,
    scaffoldBackgroundColor: Coloors.backgroundLight,
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
      CustomThemeExtension.lightMode,
    ],
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Coloors.redLight,
        foregroundColor: Coloors.backgroundLight,
        splashFactory: NoSplash.splashFactory,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
    ),
  );
}
