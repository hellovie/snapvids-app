import 'package:flutter/material.dart';
import 'package:snapvids_app/common/utils/coloors.dart';

extension ExtendedTheme on BuildContext {
  CustomThemeExtension get theme {
    return Theme.of(this).extension<CustomThemeExtension>()!;
  }
}

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  static const lightMode = CustomThemeExtension(
    splashTopBgColor: Coloors.redLight,
    greyColor: Coloors.greyLight,
    blueColor: Coloors.blueLight,
    langBtnBgColor: Color(0xFFF7F8F1),
    langBtnHighlightColor: Color(0xFFE8E8ED),
  );

  static const darkMode = CustomThemeExtension(
    splashTopBgColor: Coloors.redDark,
    greyColor: Coloors.greyDark,
    blueColor: Coloors.blueDark,
    langBtnBgColor: Color(0xFF182229),
    langBtnHighlightColor: Color(0xFF09141A),
  );

  final Color? splashTopBgColor;
  final Color? greyColor;
  final Color? blueColor;
  final Color? langBtnBgColor;
  final Color? langBtnHighlightColor;

  const CustomThemeExtension({
    this.splashTopBgColor,
    this.greyColor,
    this.blueColor,
    this.langBtnBgColor,
    this.langBtnHighlightColor,
  });

  @override
  ThemeExtension<CustomThemeExtension> copyWith({
    Color? splashTopBgColor,
    Color? greyColor,
    Color? blueColor,
    Color? langBtnBgColor,
    Color? langBtnHighlightColor,
  }) {
    return CustomThemeExtension(
      splashTopBgColor: splashTopBgColor ?? this.splashTopBgColor,
      greyColor: greyColor ?? this.greyColor,
      blueColor: blueColor ?? this.blueColor,
      langBtnBgColor: langBtnBgColor ?? this.langBtnBgColor,
      langBtnHighlightColor: langBtnHighlightColor ?? this.langBtnHighlightColor,
    );
  }

  @override
  ThemeExtension<CustomThemeExtension> lerp(ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this;
    return CustomThemeExtension(
      splashTopBgColor: Color.lerp(splashTopBgColor, other.splashTopBgColor, t),
      greyColor: Color.lerp(greyColor, other.greyColor, t),
      blueColor: Color.lerp(blueColor, other.blueColor, t),
      langBtnBgColor: Color.lerp(langBtnBgColor, other.langBtnBgColor, t),
      langBtnHighlightColor: Color.lerp(langBtnHighlightColor, other.langBtnHighlightColor, t),
    );
  }
}
