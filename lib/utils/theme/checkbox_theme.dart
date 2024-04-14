import 'package:flutter/material.dart';

class SCheckboxTheme {
  SCheckboxTheme._();

  static final CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      return states.contains(MaterialState.selected) ? Colors.white : Colors.black;
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      return states.contains(MaterialState.selected) ? Colors.blue : Colors.transparent;
    }),
  );

  static final CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      return states.contains(MaterialState.selected) ? Colors.white : Colors.black;
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      return states.contains(MaterialState.selected) ? Colors.blue : Colors.transparent;
    }),
  );
}
