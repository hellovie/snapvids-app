import 'package:flutter/material.dart';

class UiColors {
  UiColors._();

  // App Basic Colors
  static const Color primary = Color(0xFFF21458);
  static const Color secondary = Color(0xFF37FFEC);
  static const Color onPrimary = Colors.white;
  static const Color onSecondary = Colors.white;

  // Gradient Colors
  static const Gradient appNameColor = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, secondary],
  );

  // Background Colors
  static const Color backgroundLight = Color(0xFFFAFAFA);
  static const Color backgroundDark = Color(0xFF141414);
  static const Color onBackgroundLight = textPrimaryLight;
  static const Color onBackgroundDark = textPrimaryDark;

  // Surface Colors
  static const Color surfaceLight = Color(0xFFFAFAFA);
  static const Color surfaceDark = Color(0xFF141414);
  static const Color onSurfaceLight = textPrimaryLight;
  static const Color onSurfaceDark = textPrimaryDark;

  // NavigationBar Colors
  static const Color navigationBarBackgroundLight = Color(0xFFFFFFFF);
  static const Color navigationBarBackgroundDark = Color(0xFF000000);
  static const Color navigationBarSelectedColorLight = backgroundDark;
  static final Color navigationBarUnselectedColorLight = backgroundDark.withOpacity(0.7);
  static const Color navigationBarSelectedColorDark = backgroundLight;
  static final Color navigationBarUnselectedColorDark = backgroundLight.withOpacity(0.7);

  // NavigationBottomBar Colors
  static const Color navigationBottomBarBackgroundLight = Color(0xFFFFFFFF);
  static const Color navigationBottomBarBackgroundDark = Color(0xFF000000);
  static const Color navigationBottomBarSelectedColorLight = backgroundDark;
  static final Color navigationBottomBarUnselectedColorLight = backgroundDark.withOpacity(0.7);
  static const Color navigationBottomBarSelectedColorDark = backgroundLight;
  static final Color navigationBottomBarUnselectedColorDark = backgroundLight.withOpacity(0.7);

  // BottomAppBar Colors
  static const Color bottomAppBarBackgroundLight = Color(0xFFFFFFFF);
  static const Color bottomAppBarBackgroundDark = Color(0xFF000000);
  static const Color bottomAppBarSelectedLight = backgroundDark;
  static final Color bottomAppBarUnselectedLight = backgroundDark.withOpacity(0.7);
  static const Color bottomAppBarSelectedDark = backgroundLight;
  static final Color bottomAppBarUnselectedDark = backgroundLight.withOpacity(0.7);

  // Text Colors
  static const Color textTitleLight = Color.fromRGBO(0, 0, 0, 0.88); // rgba(0, 0, 0, 0.88);
  static const Color textTitleDark =
      Color.fromRGBO(255, 255, 255, 0.85); // rgba(255, 255, 255, 0.85);
  static const Color textPrimaryLight = Color.fromRGBO(0, 0, 0, 0.88); // rgba(0, 0, 0, 0.88);
  static const Color textPrimaryDark =
      Color.fromRGBO(255, 255, 255, 0.85); // rgba(255, 255, 255, 0.85);
  static const Color textSecondaryLight = Color.fromRGBO(0, 0, 0, 0.65); // rgba(0, 0, 0, 0.65);
  static const Color textSecondaryDark =
      Color.fromRGBO(255, 255, 255, 0.65); // rgba(255, 255, 255, 0.65);
  static const Color textDisabledLight = Color.fromRGBO(0, 0, 0, 0.25); // rgba(0, 0, 0, 0.25);
  static const Color textDisabledDark =
      Color.fromRGBO(255, 255, 255, 0.25); // rgba(255, 255, 255, 0.25);

  // Divider Line Colors
  static const Color dividerLineLight = Color.fromRGBO(5, 5, 5, 0.06); // rgba(5, 5, 5, 0.06);
  static const Color dividerLineDark =
      Color.fromRGBO(253, 253, 253, 0.12); // rgba(253, 253, 253, 0.12);

  // Border Colors
  static const Color borderPrimaryLight = Color.fromRGBO(217, 217, 217, 1); // rgb(217, 217, 217);
  static const Color borderPrimaryDark = Color.fromRGBO(66, 66, 66, 1); // rgb(66, 66, 66);

  // Link Colors
  static const Color linkLight = Color(0xFF1677FF);
  static const Color linkDark = Color(0xFF1668DC);

  // Feedback Colors
  static const Color successLight = Color(0xFF52C41A);
  static const Color successDark = Color(0xFF49AA19);
  static const Color onSuccessLight = Colors.white;
  static const Color onSuccessDark = Colors.white;
  static const Color warningLight = Color(0xFFFA8C16);
  static const Color warningDark = Color(0xFFD87A16);
  static const Color onWarningLight = Colors.white;
  static const Color onWarningDark = Colors.white;
  static const Color errorLight = Color(0xFFF5222D);
  static const Color errorDark = Color(0xFFD32029);
  static const Color onErrorLight = Colors.white;
  static const Color onErrorDark = Colors.white;
  static const Color infoLight = Color(0xFF1677FF);
  static const Color infoDark = Color(0xFF1668DC);
  static const Color onInfoLight = Colors.white;
  static const Color onInfoDark = Colors.white;

  // Message Circle Colors
  static const Color messagePromptCircleLight = errorLight;
  static const Color messagePromptCircleDark = errorDark;
  static const Color onMessagePromptCircleLight = onErrorLight;
  static const Color onMessagePromptCircleDark = onErrorDark;

  // Button Colors
  static const Color elevatedButtonBackground = primary;
  static const Color elevatedButtonForeground = Colors.white;
  static final HSLColor _elevatedButtonForegroundHsl = HSLColor.fromColor(elevatedButtonForeground);
  static final HSLColor _elevatedButtonBackgroundHsl = HSLColor.fromColor(elevatedButtonBackground);
  static final Color elevatedButtonForegroundDisabledLight = _elevatedButtonForegroundHsl
      .withLightness((_elevatedButtonForegroundHsl.lightness * 1.4).clamp(0.0, 1.0))
      .toColor();
  static final Color elevatedButtonBackgroundDisabledLight = _elevatedButtonBackgroundHsl
      .withLightness((_elevatedButtonBackgroundHsl.lightness * 1.6).clamp(0.0, 1.0))
      .toColor();
  static final Color elevatedButtonForegroundDisabledDark = _elevatedButtonForegroundHsl
      .withLightness((_elevatedButtonForegroundHsl.lightness * 1.8).clamp(0.0, 1.0))
      .toColor();
  static final Color elevatedButtonBackgroundDisabledDark = _elevatedButtonBackgroundHsl
      .withLightness((_elevatedButtonBackgroundHsl.lightness * 1.2).clamp(0.0, 1.0))
      .toColor();
  static const Color outlinedButtonBackground = Colors.transparent;
  static const Color outlinedButtonForegroundLight = backgroundDark;
  static final Color outlinedButtonForegroundDisabledLight =
      outlinedButtonForegroundLight.withOpacity(0.6);
  static const Color outlinedButtonForegroundDark = backgroundLight;
  static final Color outlinedButtonForegroundDisabledDark =
      outlinedButtonForegroundDark.withOpacity(0.6);

  // Icon Colors
  static const Color iconPrimaryLight = backgroundDark;
  static const Color iconPrimaryDark = backgroundLight;
  static final Color iconSecondaryLight = iconPrimaryLight.withOpacity(0.3);
  static final Color iconSecondaryDark = iconPrimaryDark.withOpacity(0.3);

  // Input Field Colors
  static final Color inputFieldFillLight = backgroundDark.withOpacity(0.1);
  static final Color inputFieldFillDark = backgroundLight.withOpacity(0.1);

  // Checkbox Colors
  static final Color checkboxBorderLight = backgroundDark.withOpacity(0.7);
  static final Color checkboxBorderDark = backgroundLight.withOpacity(0.7);
  static const Color checkboxFillLight = primary;
  static const Color checkboxFillDark = primary;
  static const Color checkboxCheckLight = Colors.white;
  static const Color checkboxCheckDark = Colors.white;

  // Bottom Sheet Colors
  static const Color bottomSheetPrimaryBackgroundLight = backgroundLight;
  static const Color bottomSheetPrimaryBackgroundDark = backgroundDark;

  // Loading Indicator Background Color
  static const Color loadingIndicatorBackground = Colors.black87;

  // Creation Colors
  static const Color creationAvatarBorder = Colors.white;
  static const Color creationActionInactive = Colors.white;
  static const Color creationActionLiked = Color(0xFFF7365D);
  static const Color creationActionCollected = Color(0xFFFBB101);
  static const Color creationBgmRecordBackground = Colors.black26;
  static final Color creationPauseIcon = Colors.white.withOpacity(0.3);
  static const Color creationPrimaryFont = Colors.white;
  static const Color creationSecondaryFont = Color(0xDDFFFFFF);
  static final Color creationFontShadow = Colors.black.withOpacity(0.3);

  // Creation Screen Colors
  static const Color creationScreenIcon = Colors.white;

  // Toast Colors
  static const Color toastIndicator = primary;
  static const Color toastProgress = onPrimary;
  static const Color toastText = onPrimary;
  static const Color toastBackground = Colors.black87;
}
