import 'package:flutter/material.dart';
import 'package:snapvids_app/utils/constants/ui_colors.dart';
import 'package:snapvids_app/utils/themes/custom/appbar_theme.dart';
import 'package:snapvids_app/utils/themes/custom/bottom_appbar_theme.dart';
import 'package:snapvids_app/utils/themes/custom/bottom_navigation_bar_theme.dart';
import 'package:snapvids_app/utils/themes/custom/icon_theme.dart';
import 'package:snapvids_app/utils/themes/custom/navigation_bar_theme.dart';
import 'package:snapvids_app/utils/themes/custom/bottom_sheet_theme.dart';
import 'package:snapvids_app/utils/themes/custom/checkbox_theme.dart';
import 'package:snapvids_app/utils/themes/custom/chip_theme.dart';
import 'package:snapvids_app/utils/themes/custom/dialog_theme.dart';
import 'package:snapvids_app/utils/themes/custom/elevated_button_theme.dart';
import 'package:snapvids_app/utils/themes/custom/input_decoration_theme.dart';
import 'package:snapvids_app/utils/themes/custom/list_tile_theme.dart';
import 'package:snapvids_app/utils/themes/custom/outlined_button_theme.dart';
import 'package:snapvids_app/utils/themes/custom/text_theme.dart';
import 'package:snapvids_app/utils/themes/extension/color_extension.dart';

class SnapvidsAppTheme {
  SnapvidsAppTheme._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'SourceHanSansCN',
    extensions: [ColorExtension.lightMode],
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: UiColors.primary,
      secondary: UiColors.secondary,
      onPrimary: UiColors.onPrimary,
      onSecondary: UiColors.onSecondary,
      error: UiColors.errorLight,
      onError: UiColors.onErrorLight,
      background: UiColors.backgroundLight,
      onBackground: UiColors.onBackgroundLight,
      surface: UiColors.surfaceLight,
      onSurface: UiColors.onSurfaceLight,
    ),
    brightness: Brightness.light,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    iconTheme: SnapvidsIconTheme.lightIconTheme,
    textTheme: SnapvidsTextTheme.lightTextTheme,
    elevatedButtonTheme: SnapvidsElevatedButtonTheme.lightElevatedButtonThemeTheme,
    appBarTheme: SnapvidsAppBarTheme.lightAppBarTheme,
    bottomAppBarTheme: SnapvidsBottomAppBarTheme.lightBottomAppBarTheme,
    navigationBarTheme: SnapvidsNavigationBarTheme.lightNavigationBarTheme,
    bottomNavigationBarTheme: SnapvidsBottomNavigationBarTheme.lightBottomNavigationBarTheme,
    bottomSheetTheme: SnapvidsBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: SnapvidsCheckboxTheme.lightCheckboxTheme,
    listTileTheme: SnapvidsListTileTheme.lightListTileTheme,
    chipTheme: SnapvidsChipTheme.lightChipTheme,
    outlinedButtonTheme: SnapvidsOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: SnapvidsInputDecorationTheme.lightInputDecorationTheme,
    dialogTheme: SnapvidsDialogTheme.lightDialogTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'SourceHanSansCN',
    extensions: [ColorExtension.darkMode],
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: UiColors.primary,
      secondary: UiColors.secondary,
      onPrimary: UiColors.onPrimary,
      onSecondary: UiColors.onSecondary,
      error: UiColors.errorDark,
      onError: UiColors.onErrorDark,
      background: UiColors.backgroundDark,
      onBackground: UiColors.onBackgroundDark,
      surface: UiColors.surfaceDark,
      onSurface: UiColors.onSurfaceDark,
    ),
    brightness: Brightness.dark,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    iconTheme: SnapvidsIconTheme.darkIconTheme,
    textTheme: SnapvidsTextTheme.darkTextTheme,
    elevatedButtonTheme: SnapvidsElevatedButtonTheme.darkElevatedButtonThemeTheme,
    appBarTheme: SnapvidsAppBarTheme.darkAppBarTheme,
    bottomAppBarTheme: SnapvidsBottomAppBarTheme.darkBottomAppBarTheme,
    navigationBarTheme: SnapvidsNavigationBarTheme.darkNavigationBarTheme,
    bottomNavigationBarTheme: SnapvidsBottomNavigationBarTheme.darkBottomNavigationBarTheme,
    bottomSheetTheme: SnapvidsBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: SnapvidsCheckboxTheme.darkCheckboxTheme,
    listTileTheme: SnapvidsListTileTheme.darkListTileTheme,
    chipTheme: SnapvidsChipTheme.darkChipTheme,
    outlinedButtonTheme: SnapvidsOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: SnapvidsInputDecorationTheme.darkInputDecorationTheme,
    dialogTheme: SnapvidsDialogTheme.darkDialogTheme,
  );
}
