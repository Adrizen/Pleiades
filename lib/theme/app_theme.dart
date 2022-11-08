import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Colors.indigo;
  static const Color secondaryColor = Color.fromRGBO(13, 250, 210, 0.8);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    // Primary app color.
    primaryColor: primaryColor,

    //AppBar theme.
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(color: primaryColor, elevation: 0),
  );

  static final ThemeData darkTheme = ThemeData.light().copyWith(
    // Primary app color.
    primaryColor: secondaryColor,
    textTheme: const TextTheme(titleMedium: TextStyle(color: Colors.white)),
    //AppBar theme.
    scaffoldBackgroundColor: Color.fromARGB(255, 1, 11, 12),
    appBarTheme: const AppBarTheme(color: secondaryColor, elevation: 0),
  );
}
