import 'package:flutter/material.dart';
import 'package:snapvids_app/utils/constants/ui_colors.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';

class SnapvidsBottomAppBarTheme {
  SnapvidsBottomAppBarTheme._();

  static const BottomAppBarTheme lightBottomAppBarTheme = BottomAppBarTheme(
    elevation: 0,
    padding: EdgeInsets.zero,
    color: UiColors.bottomAppBarBackgroundLight,
    surfaceTintColor: Colors.transparent,
    shadowColor: Colors.transparent,
    height: UiSizes.bottomAppBarHeight,
  );

  static const BottomAppBarTheme darkBottomAppBarTheme = BottomAppBarTheme(
    elevation: 0,
    padding: EdgeInsets.zero,
    color: UiColors.bottomAppBarBackgroundDark,
    surfaceTintColor: Colors.transparent,
    shadowColor: Colors.transparent,
    height: UiSizes.bottomAppBarHeight,
  );
}
