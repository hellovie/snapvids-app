import 'package:flutter/material.dart';

class STextTheme {
  STextTheme._();

  static const double _fontSizeDisplayLarge = 57.0;
  static const double _fontSizeDisplayMedium = 45.0;
  static const double _fontSizeDisplaySmall = 36.0;
  static const double _fontSizeHeadlineLarge = 32.0;
  static const double _fontSizeHeadlineMedium = 28.0;
  static const double _fontSizeHeadlineSmall = 24.0;
  static const double _fontSizeTitleLarge = 22.0;
  static const double _fontSizeTitleMedium = 16.0;
  static const double _fontSizeTitleSmall = 14.0;
  static const double _fontSizeBodyLarge = 16.0;
  static const double _fontSizeBodyMedium = 14.0;
  static const double _fontSizeBodySmall = 12.0;
  static const double _fontSizeLabelLarge = 14.0;
  static const double _fontSizeLabelMedium = 12.0;
  static const double _fontSizeLabelSmall = 11.0;

  static const FontWeight _fontWeightDisplayLarge = FontWeight.w900;
  static const FontWeight _fontWeightDisplayMedium = FontWeight.w900;
  static const FontWeight _fontWeightDisplaySmall = FontWeight.w900;
  static const FontWeight _fontWeightHeadlineLarge = FontWeight.bold;
  static const FontWeight _fontWeightHeadlineMedium = FontWeight.w600;
  static const FontWeight _fontWeightHeadlineSmall = FontWeight.w600;
  static const FontWeight _fontWeightTitleLarge = FontWeight.w600;
  static const FontWeight _fontWeightTitleMedium = FontWeight.w500;
  static const FontWeight _fontWeightTitleSmall = FontWeight.w400;
  static const FontWeight _fontWeightBodyLarge = FontWeight.w500;
  static const FontWeight _fontWeightBodyMedium = FontWeight.normal;
  static const FontWeight _fontWeightBodySmall = FontWeight.w500;
  static const FontWeight _fontWeightLabelLarge = FontWeight.normal;
  static const FontWeight _fontWeightLabelMedium = FontWeight.normal;
  static const FontWeight _fontWeightLabelSmall = FontWeight.normal;

  static const TextTheme lightTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: _fontSizeDisplayLarge,
      fontWeight: _fontWeightDisplayLarge,
      color: Color(0xFF1D2129),
    ),
    displayMedium: TextStyle(
      fontSize: _fontSizeDisplayMedium,
      fontWeight: _fontWeightDisplayMedium,
      color: Color(0xFF1D2129),
    ),
    displaySmall: TextStyle(
      fontSize: _fontSizeDisplaySmall,
      fontWeight: _fontWeightDisplaySmall,
      color: Color(0xFF1D2129),
    ),
    headlineLarge: TextStyle(
      fontSize: _fontSizeHeadlineLarge,
      fontWeight: _fontWeightHeadlineLarge,
      color: Color(0xFF1D2129),
    ),
    headlineMedium: TextStyle(
      fontSize: _fontSizeHeadlineMedium,
      fontWeight: _fontWeightHeadlineMedium,
      color: Color(0xFF1D2129),
    ),
    headlineSmall: TextStyle(
      fontSize: _fontSizeHeadlineSmall,
      fontWeight: _fontWeightHeadlineSmall,
      color: Color(0xFF1D2129),
    ),
    titleLarge: TextStyle(
      fontSize: _fontSizeTitleLarge,
      fontWeight: _fontWeightTitleLarge,
      color: Color(0xFF1D2129),
    ),
    titleMedium: TextStyle(
      fontSize: _fontSizeTitleMedium,
      fontWeight: _fontWeightTitleMedium,
      color: Color(0xFF1D2129),
    ),
    titleSmall: TextStyle(
      fontSize: _fontSizeTitleSmall,
      fontWeight: _fontWeightTitleSmall,
      color: Color(0xFF1D2129),
    ),
    bodyLarge: TextStyle(
      fontSize: _fontSizeBodyLarge,
      fontWeight: _fontWeightBodyLarge,
      color: Color(0xFF1D2129),
    ),
    bodyMedium: TextStyle(
      fontSize: _fontSizeBodyMedium,
      fontWeight: _fontWeightBodyMedium,
      color: Color(0xFF1D2129),
    ),
    bodySmall: TextStyle(
      fontSize: _fontSizeBodySmall,
      fontWeight: _fontWeightBodySmall,
      color: Color(0xFF4E5969),
    ),
    labelLarge: TextStyle(
      fontSize: _fontSizeLabelLarge,
      fontWeight: _fontWeightLabelLarge,
      color: Color(0xFF1D2129),
    ),
    labelMedium: TextStyle(
      fontSize: _fontSizeLabelMedium,
      fontWeight: _fontWeightLabelMedium,
      color: Color(0xFF4E5969),
    ),
    labelSmall: TextStyle(
      fontSize: _fontSizeLabelSmall,
      fontWeight: _fontWeightLabelSmall,
      color: Color(0xFF86909C),
    ),
  );

  static const TextTheme darkTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: _fontSizeDisplayLarge,
      fontWeight: _fontWeightDisplayLarge,
      color: Color.fromARGB(230, 255, 255, 255),
    ),
    displayMedium: TextStyle(
      fontSize: _fontSizeDisplayMedium,
      fontWeight: _fontWeightDisplayMedium,
      color: Color.fromARGB(230, 255, 255, 255),
    ),
    displaySmall: TextStyle(
      fontSize: _fontSizeDisplaySmall,
      fontWeight: _fontWeightDisplaySmall,
      color: Color.fromARGB(230, 255, 255, 255),
    ),
    headlineLarge: TextStyle(
      fontSize: _fontSizeHeadlineLarge,
      fontWeight: _fontWeightHeadlineLarge,
      color: Color.fromARGB(230, 255, 255, 255),
    ),
    headlineMedium: TextStyle(
      fontSize: _fontSizeHeadlineMedium,
      fontWeight: _fontWeightHeadlineMedium,
      color: Color.fromARGB(230, 255, 255, 255),
    ),
    headlineSmall: TextStyle(
      fontSize: _fontSizeHeadlineSmall,
      fontWeight: _fontWeightHeadlineSmall,
      color: Color.fromARGB(230, 255, 255, 255),
    ),
    titleLarge: TextStyle(
      fontSize: _fontSizeTitleLarge,
      fontWeight: _fontWeightTitleLarge,
      color: Color.fromARGB(230, 255, 255, 255),
    ),
    titleMedium: TextStyle(
      fontSize: _fontSizeTitleMedium,
      fontWeight: _fontWeightTitleMedium,
      color: Color.fromARGB(230, 255, 255, 255),
    ),
    titleSmall: TextStyle(
      fontSize: _fontSizeTitleSmall,
      fontWeight: _fontWeightTitleSmall,
      color: Color.fromARGB(230, 255, 255, 255),
    ),
    bodyLarge: TextStyle(
      fontSize: _fontSizeBodyLarge,
      fontWeight: _fontWeightBodyLarge,
      color: Color.fromARGB(230, 255, 255, 255),
    ),
    bodyMedium: TextStyle(
      fontSize: _fontSizeBodyMedium,
      fontWeight: _fontWeightBodyMedium,
      color: Color.fromARGB(230, 255, 255, 255),
    ),
    bodySmall: TextStyle(
      fontSize: _fontSizeBodySmall,
      fontWeight: _fontWeightBodySmall,
      color: Color.fromARGB(179, 255, 255, 255),
    ),
    labelLarge: TextStyle(
      fontSize: _fontSizeLabelLarge,
      fontWeight: _fontWeightLabelLarge,
      color: Color.fromARGB(230, 255, 255, 255),
    ),
    labelMedium: TextStyle(
      fontSize: _fontSizeLabelMedium,
      fontWeight: _fontWeightLabelMedium,
      color: Color.fromARGB(179, 255, 255, 255),
    ),
    labelSmall: TextStyle(
      fontSize: _fontSizeLabelSmall,
      fontWeight: _fontWeightLabelSmall,
      color: Color.fromARGB(128, 255, 255, 255),
    ),
  );
}
