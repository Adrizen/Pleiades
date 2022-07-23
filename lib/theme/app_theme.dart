import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Colors.indigo;
  static const Color secondaryColor = Colors.red;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    // Primary app color.
    primaryColor: primaryColor,

    //AppBar theme.
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(color: primaryColor, elevation: 0),
  );

  static final ThemeData darkTheme = ThemeData.light().copyWith(
    // Primary app color.
    primaryColor: secondaryColor,

    //AppBar theme.
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(color: secondaryColor, elevation: 0),
  );
}
