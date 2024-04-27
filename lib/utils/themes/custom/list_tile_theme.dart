import 'package:flutter/material.dart';
import 'package:snapvids_app/utils/constants/ui_sizes.dart';

class SnapvidsListTileTheme {
  SnapvidsListTileTheme._();

  static const ListTileThemeData lightListTileTheme = ListTileThemeData(
    minVerticalPadding: 0,
    contentPadding: EdgeInsets.zero,
    horizontalTitleGap: UiSizes.sm,
    visualDensity: VisualDensity(
      vertical: VisualDensity.minimumDensity,
    ),
  );

  static const ListTileThemeData darkListTileTheme = ListTileThemeData(
    minVerticalPadding: 0,
    contentPadding: EdgeInsets.zero,
    horizontalTitleGap: UiSizes.sm,
    visualDensity: VisualDensity(
      vertical: VisualDensity.minimumDensity,
    ),
  );
}
