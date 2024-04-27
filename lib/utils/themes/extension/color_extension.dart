import 'package:flutter/material.dart';
import 'package:snapvids_app/utils/constants/ui_colors.dart';

extension ExtendedTheme on BuildContext {
  ColorExtension get colorExtension {
    return Theme.of(this).extension<ColorExtension>()!;
  }
}

class ColorExtension extends ThemeExtension<ColorExtension> {
  static final lightMode = ColorExtension(
    link: UiColors.linkLight,
    textTitle: UiColors.textTitleLight,
    textPrimary: UiColors.textPrimaryLight,
    textSecondary: UiColors.textSecondaryLight,
    textDisabled: UiColors.textDisabledLight,
    dividerLine: UiColors.dividerLineLight,
    borderPrimary: UiColors.borderPrimaryLight,
    iconPrimary: UiColors.iconPrimaryLight,
    iconSecondary: UiColors.iconSecondaryLight,
    inputFieldFill: UiColors.inputFieldFillLight,
    background: UiColors.backgroundLight,
    messagePromptCircle: UiColors.messagePromptCircleLight,
    onMessagePromptCircle: UiColors.onMessagePromptCircleLight,
    bottomAppBarSelectedColor: UiColors.bottomAppBarSelectedColorLight,
    bottomAppBarUnselectedColor: UiColors.bottomAppBarUnselectedColorLight,
  );

  static final darkMode = ColorExtension(
    link: UiColors.linkDark,
    textTitle: UiColors.textTitleDark,
    textPrimary: UiColors.textPrimaryDark,
    textSecondary: UiColors.textSecondaryDark,
    textDisabled: UiColors.textDisabledDark,
    dividerLine: UiColors.dividerLineDark,
    borderPrimary: UiColors.borderPrimaryDark,
    iconPrimary: UiColors.iconPrimaryDark,
    iconSecondary: UiColors.iconSecondaryDark,
    inputFieldFill: UiColors.inputFieldFillDark,
    background: UiColors.backgroundDark,
    messagePromptCircle: UiColors.messagePromptCircleDark,
    onMessagePromptCircle: UiColors.onMessagePromptCircleDark,
    bottomAppBarSelectedColor: UiColors.bottomAppBarSelectedColorDark,
    bottomAppBarUnselectedColor: UiColors.bottomAppBarUnselectedColorDark,
  );

  final Color? link;
  final Color? textTitle;
  final Color? textPrimary;
  final Color? textSecondary;
  final Color? textDisabled;
  final Color? dividerLine;
  final Color? borderPrimary;
  final Color? iconPrimary;
  final Color? iconSecondary;
  final Color? inputFieldFill;
  final Color? background;
  final Color? messagePromptCircle;
  final Color? onMessagePromptCircle;
  final Color? bottomAppBarSelectedColor;
  final Color? bottomAppBarUnselectedColor;

  const ColorExtension({
    this.link,
    this.textTitle,
    this.textPrimary,
    this.textSecondary,
    this.textDisabled,
    this.dividerLine,
    this.borderPrimary,
    this.iconPrimary,
    this.iconSecondary,
    this.inputFieldFill,
    this.background,
    this.messagePromptCircle,
    this.onMessagePromptCircle,
    this.bottomAppBarSelectedColor,
    this.bottomAppBarUnselectedColor,
  });

  @override
  ThemeExtension<ColorExtension> copyWith({
    Color? link,
    Color? textTitle,
    Color? textPrimary,
    Color? textSecondary,
    Color? textDisabled,
    Color? dividerLine,
    Color? borderPrimary,
    Color? iconPrimary,
    Color? iconSecondary,
    Color? inputFieldFill,
    Color? background,
    Color? messagePromptCircle,
    Color? onMessagePromptCircle,
    Color? bottomAppBarSelectedColor,
    Color? bottomAppBarUnselectedColor,
  }) {
    return ColorExtension(
      link: link ?? this.link,
      textTitle: textTitle ?? this.textTitle,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textDisabled: textDisabled ?? this.textDisabled,
      dividerLine: dividerLine ?? this.dividerLine,
      borderPrimary: borderPrimary ?? this.borderPrimary,
      iconPrimary: iconPrimary ?? this.iconPrimary,
      iconSecondary: iconSecondary ?? this.iconSecondary,
      inputFieldFill: inputFieldFill ?? this.inputFieldFill,
      background: background ?? this.background,
      messagePromptCircle: messagePromptCircle ?? this.messagePromptCircle,
      onMessagePromptCircle: onMessagePromptCircle ?? this.onMessagePromptCircle,
      bottomAppBarSelectedColor: bottomAppBarSelectedColor ?? this.bottomAppBarSelectedColor,
      bottomAppBarUnselectedColor: bottomAppBarUnselectedColor ?? this.bottomAppBarUnselectedColor,
    );
  }

  @override
  ThemeExtension<ColorExtension> lerp(ThemeExtension<ColorExtension>? other, double t) {
    if (other is! ColorExtension) return this;
    return ColorExtension(
      link: Color.lerp(link, other.link, t),
      textTitle: Color.lerp(textTitle, other.textTitle, t),
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t),
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t),
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t),
      dividerLine: Color.lerp(dividerLine, other.dividerLine, t),
      borderPrimary: Color.lerp(borderPrimary, other.borderPrimary, t),
      iconPrimary: Color.lerp(iconPrimary, other.iconPrimary, t),
      iconSecondary: Color.lerp(iconSecondary, other.iconSecondary, t),
      inputFieldFill: Color.lerp(inputFieldFill, other.inputFieldFill, t),
      background: Color.lerp(background, other.background, t),
      messagePromptCircle: Color.lerp(messagePromptCircle, other.messagePromptCircle, t),
      onMessagePromptCircle: Color.lerp(onMessagePromptCircle, other.onMessagePromptCircle, t),
      bottomAppBarSelectedColor:
          Color.lerp(bottomAppBarSelectedColor, other.bottomAppBarSelectedColor, t),
      bottomAppBarUnselectedColor:
          Color.lerp(bottomAppBarUnselectedColor, other.bottomAppBarUnselectedColor, t),
    );
  }
}
