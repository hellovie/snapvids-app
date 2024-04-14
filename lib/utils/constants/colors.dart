import 'package:flutter/material.dart';

class SColors {
  SColors._();

  // App Basic Colors
  static const Color primary = Color(0xFFF21458);
  static const Color secondary = Color(0xFF37FFEC);
  static const Color accent = Color(0xFFFCBCC7);

  // Gradient Colors
  static const Gradient linerGradient = LinearGradient(
    begin: Alignment(0, 0),
    end: Alignment(0.707, -0.707),
    colors: [primary, secondary],
  );

  // Text Colors
  static const Color textPrimary = Color(0xFF1D2129);
  static const Color textSecondary = Color(0xFF86909C);
  static const Color textWhite = Color(0xFFF7F8FA);

  // Background Colors
  static const Color light = Color(0xFFFFFFFF);
  static const Color dark = Color(0xFF1D2129);
  static const Color backgroundPrimary = Color(0xFFF7F8FA);

  // Background Container Colors
  static const Color lightContainer = Color(0xFFFFFFFF);
  static Color darkContainer = const Color(0xFF232324);

  // Button Colors
  static const Color buttonPrimary  = primary;
  static const Color buttonSecondary = secondary;
  static const Color buttonDisabled = Color(0xFFC9CDD4);

  // Border Colors
  static const Color borderPrimary  = Color(0xFFE5E6EB);
  static const Color borderSecondary = Color(0xFFF2F3F5);

  // Error and Validation Colors
  static const Color error  = Color(0xFFF53F3F);
  static const Color success  = Color(0xFF00B42A);
  static const Color warning  = Color(0xFFFF7D00);
  static const Color info  = Color(0xFF165DFF);

  // Neutral Shades
  static const Color black  = Color(0xFF232323);
  static const Color darkerGrey  = Color(0xFF4F4F4F);
  static const Color darkGrey  = Color(0xFF939393);
  static const Color grey  = Color(0xFFE0E0E0);
  static const Color softGrey  = Color(0xFFF4F4F4);
  static const Color lightGrey  = Color(0xFFF9F9F9);
  static const Color white  = Color(0xFFFFFFFF);
}
