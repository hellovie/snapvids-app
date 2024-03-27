import 'package:flutter/material.dart';
import 'package:snapvids_app/common/extension/custom_theme_extension.dart';

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    useMaterial3: true,
    // 点击时的高亮效果设置为透明
    splashColor: Colors.transparent,
    // 长按时的扩散效果设置为透明
    highlightColor: Colors.transparent,
    extensions: [
      CustomThemeExtension.darkMode,
    ],
  );
}
