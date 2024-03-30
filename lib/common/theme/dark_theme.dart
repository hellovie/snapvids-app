import 'package:flutter/material.dart';
import 'package:snapvids_app/common/config/design_variables.dart';
import 'package:snapvids_app/common/extension/custom_theme_extension.dart';

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    extensions: [
      CustomThemeExtension.darkMode,
    ],

    /// 通用样式
    useMaterial3: true,
    // 点击时的高亮效果设置为透明
    splashColor: Colors.transparent,
    // 长按时的扩散效果设置为透明
    highlightColor: Colors.transparent,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(DesignVariables.borderRadiusMedium),
        ),
        splashFactory: NoSplash.splashFactory,
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
    ),
    checkboxTheme: const CheckboxThemeData(
      shape: CircleBorder(),
      visualDensity: VisualDensity(
        horizontal: VisualDensity.minimumDensity,
      ),
      splashRadius: 0,
    ),
    listTileTheme: const ListTileThemeData(
      dense: true,
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: DesignVariables.spaceSmall,
      visualDensity: VisualDensity(
        vertical: VisualDensity.minimumDensity,
      ),
    ),
    dividerTheme: DividerThemeData(
      thickness: 1,
      color: CustomThemeExtension.darkMode.gray_2,
      endIndent: 0,
      indent: 0,
    ),
  );
}
