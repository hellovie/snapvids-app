import 'package:flutter/material.dart';
import 'package:snapvids_app/utils/theme/appbar_theme.dart';
import 'package:snapvids_app/utils/theme/bottom_sheet_theme.dart';
import 'package:snapvids_app/utils/theme/checkbox_theme.dart';
import 'package:snapvids_app/utils/theme/chip_theme.dart';
import 'package:snapvids_app/utils/theme/elevated_button_theme.dart';
import 'package:snapvids_app/utils/theme/input_decoration_theme.dart';
import 'package:snapvids_app/utils/theme/outlined_button_theme.dart';
import 'package:snapvids_app/utils/theme/text_theme.dart';

class SAppTheme {
  SAppTheme._();

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    textTheme: STextTheme.lightTextTheme,
    elevatedButtonTheme: SElevatedButtonTheme.lightElevatedButtonThemeTheme,
    appBarTheme: SAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: SBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: SCheckboxTheme.lightCheckboxTheme,
    chipTheme: SChipTheme.lightChipTheme,
    outlinedButtonTheme: SOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: SInputDecorationTheme.lightInputDecorationTheme,
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    textTheme: STextTheme.darkTextTheme,
    elevatedButtonTheme: SElevatedButtonTheme.darkElevatedButtonThemeTheme,
    appBarTheme: SAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: SBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: SCheckboxTheme.darkCheckboxTheme,
    chipTheme: SChipTheme.darkChipTheme,
    outlinedButtonTheme: SOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: SInputDecorationTheme.darkInputDecorationTheme,
  );
}
