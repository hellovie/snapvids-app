import 'package:flutter/material.dart';
import 'package:snapvids_app/common/styles/font_styles.dart';
import 'package:snapvids_app/utils/constants/ui_colors.dart';

class SnapvidsBottomNavigationBarTheme {
  SnapvidsBottomNavigationBarTheme._();

  static BottomNavigationBarThemeData lightBottomNavigationBarTheme =
      BottomNavigationBarThemeData(
        elevation: 0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: UiColors.navigationBottomBarBackgroundLight,
        selectedItemColor: UiColors.navigationBottomBarSelectedColorLight,
        unselectedItemColor: UiColors.navigationBottomBarUnselectedColorLight,
        selectedIconTheme: const IconThemeData(
          color: UiColors.navigationBottomBarSelectedColorLight,
        ),
        unselectedIconTheme: IconThemeData(
          color: UiColors.navigationBottomBarUnselectedColorLight,
        ),
        selectedLabelStyle: FontStyles.labelSmall.copyWith(fontWeight: FontWeight.bold),
        unselectedLabelStyle: FontStyles.labelSmall.copyWith(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed,
      );

  static BottomNavigationBarThemeData darkBottomNavigationBarTheme =
      BottomNavigationBarThemeData(
        elevation: 0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        backgroundColor: UiColors.navigationBottomBarBackgroundDark,
        selectedItemColor: UiColors.navigationBottomBarSelectedColorDark,
        unselectedItemColor: UiColors.navigationBottomBarUnselectedColorDark,
        selectedIconTheme: const IconThemeData(
          color: UiColors.navigationBottomBarSelectedColorDark,
        ),
        unselectedIconTheme: IconThemeData(
          color: UiColors.navigationBottomBarUnselectedColorDark,
        ),
        selectedLabelStyle: FontStyles.labelSmall.copyWith(fontWeight: FontWeight.bold),
        unselectedLabelStyle: FontStyles.labelSmall.copyWith(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed,
      );
}
