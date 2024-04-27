import 'package:flutter/material.dart';
import 'package:snapvids_app/common/styles/font_styles.dart';
import 'package:snapvids_app/utils/constants/ui_colors.dart';

class SnapvidsNavigationBarTheme {
  SnapvidsNavigationBarTheme._();

  static NavigationBarThemeData lightNavigationBarTheme = NavigationBarThemeData(
    elevation: 0,
    backgroundColor: UiColors.navigationBarBackgroundLight,
    indicatorColor: Colors.transparent,
    labelTextStyle: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return FontStyles.labelSmall.copyWith(
          color: UiColors.navigationBarSelectedColorLight,
        );
      }
      return FontStyles.labelSmall.copyWith(
        color: UiColors.navigationBarUnselectedColorLight,
      );
    }),
    iconTheme: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return const IconThemeData(
          color: UiColors.navigationBarSelectedColorLight,
        );
      }
      return IconThemeData(
        color: UiColors.navigationBarUnselectedColorLight,
      );
    }),
  );

  static NavigationBarThemeData darkNavigationBarTheme = NavigationBarThemeData(
    elevation: 0,
    backgroundColor: UiColors.navigationBarBackgroundDark,
    indicatorColor: Colors.transparent,
    labelTextStyle: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return FontStyles.labelSmall.copyWith(
          color: UiColors.navigationBarSelectedColorDark,
        );
      }
      return FontStyles.labelSmall.copyWith(
        color: UiColors.navigationBarUnselectedColorDark,
      );
    }),
    iconTheme: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return const IconThemeData(
          color: UiColors.navigationBarSelectedColorDark,
        );
      }
      return IconThemeData(
        color: UiColors.navigationBarUnselectedColorDark,
      );
    }),
  );
}
