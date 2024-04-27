import 'package:flutter/material.dart';
import 'package:snapvids_app/utils/constants/ui_colors.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';

class SnapvidsCheckboxTheme {
  SnapvidsCheckboxTheme._();

  static final CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    splashRadius: 0,
    visualDensity: const VisualDensity(
      horizontal: VisualDensity.minimumDensity,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(UiSizes.checkboxRadius)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      return states.contains(MaterialState.selected)
          ? UiColors.checkboxCheckLight
          : Colors.transparent;
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      return states.contains(MaterialState.selected)
          ? UiColors.checkboxFillLight
          : Colors.transparent;
    }),
    side: BorderSide(color: UiColors.checkboxBorderLight),
  );

  static final CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    splashRadius: 0,
    visualDensity: const VisualDensity(
      horizontal: VisualDensity.minimumDensity,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(UiSizes.checkboxRadius)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      return states.contains(MaterialState.selected)
          ? UiColors.checkboxCheckDark
          : Colors.transparent;
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      return states.contains(MaterialState.selected)
          ? UiColors.checkboxFillDark
          : Colors.transparent;
    }),
    side: BorderSide(color: UiColors.checkboxBorderDark),
  );
}
