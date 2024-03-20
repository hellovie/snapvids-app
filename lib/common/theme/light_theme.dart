import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(fontSize: 18),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Coloors.redLight,
        foregroundColor: Coloors.backgroundLight,
        splashFactory: NoSplash.splashFactory,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Coloors.backgroundLight,
      modalBackgroundColor: Coloors.backgroundLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    ),
    dialogBackgroundColor: Coloors.backgroundLight,
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}
