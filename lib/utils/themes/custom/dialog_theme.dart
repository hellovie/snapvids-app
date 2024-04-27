import 'package:flutter/material.dart';
import 'package:snapvids_app/utils/constants/ui_colors.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';

class SnapvidsDialogTheme {
  SnapvidsDialogTheme._();

  static final DialogTheme lightDialogTheme = DialogTheme(
    elevation: 0,
    shadowColor: Colors.transparent,
    backgroundColor: UiColors.backgroundLight,
    surfaceTintColor: UiColors.backgroundLight,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(UiSizes.alertDialogRadius),
    ),
  );

  static final DialogTheme darkDialogTheme = DialogTheme(
    elevation: 0,
    shadowColor: Colors.transparent,
    backgroundColor: UiColors.backgroundDark,
    surfaceTintColor: UiColors.backgroundDark,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(UiSizes.alertDialogRadius),
    ),
  );
}