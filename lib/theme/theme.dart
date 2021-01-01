import 'package:flutter/material.dart';

/// Default app theme
final themeData = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.light,
  primaryColor: const Color.fromARGB(255, 110, 20, 69),
  accentColor: const Color.fromARGB(255, 181, 51, 70),

  textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color.fromARGB(255, 181, 51, 70)),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      primary: const Color.fromARGB(255, 181, 51, 70),
      textStyle: const TextStyle(fontSize: 32),
      minimumSize: const Size(200, 60),
    ),
  ),
);
