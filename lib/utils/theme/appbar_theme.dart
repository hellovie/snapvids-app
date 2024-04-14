import 'package:flutter/material.dart';
import 'package:snapvids_app/utils/constants/sizes.dart';

class SAppBarTheme {
  SAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black, size: SSizes.iconMd),
    actionsIconTheme: IconThemeData(color: Colors.black, size: SSizes.iconMd),
    titleTextStyle:
        TextStyle(fontSize: SSizes.fontSizeLg, fontWeight: FontWeight.w600, color: Colors.black),
  );

  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black, size: SSizes.iconMd),
    actionsIconTheme: IconThemeData(color: Colors.white, size: SSizes.iconMd),
    titleTextStyle:
        TextStyle(fontSize: SSizes.fontSizeLg, fontWeight: FontWeight.w600, color: Colors.white),
  );
}
