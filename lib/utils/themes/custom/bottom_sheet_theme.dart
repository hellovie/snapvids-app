import 'package:flutter/material.dart';
import 'package:snapvids_app/utils/constants/ui_colors.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';

class SnapvidsBottomSheetTheme {
  SnapvidsBottomSheetTheme._();

  static const BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: false,
    elevation: 0,
    modalElevation: 0,
    shadowColor: Colors.transparent,
    surfaceTintColor: UiColors.bottomSheetPrimaryBackgroundLight,
    backgroundColor: UiColors.bottomSheetPrimaryBackgroundLight,
    modalBackgroundColor: UiColors.bottomSheetPrimaryBackgroundLight,
    constraints: BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(UiSizes.bottomSheetRadius))),
  );

  static const BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: false,
    elevation: 0,
    modalElevation: 0,
    shadowColor: Colors.transparent,
    surfaceTintColor: UiColors.bottomSheetPrimaryBackgroundDark,
    backgroundColor: UiColors.bottomSheetPrimaryBackgroundDark,
    modalBackgroundColor: UiColors.bottomSheetPrimaryBackgroundDark,
    constraints: BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(UiSizes.bottomSheetRadius))),
  );
}
