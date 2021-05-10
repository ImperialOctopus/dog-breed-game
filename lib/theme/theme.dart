import 'package:flutter/material.dart';

const _primaryColor = Color.fromARGB(255, 110, 20, 69);
const _accentColor = Color.fromARGB(255, 181, 51, 70);

/// Default app theme
final themeData = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.light,
  primaryColor: _primaryColor,
  accentColor: _accentColor,
  textSelectionTheme: const TextSelectionThemeData(cursorColor: _accentColor),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      primary: _primaryColor,
      textStyle: const TextStyle(fontSize: 32),
      minimumSize: const Size(200, 60),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    primary: _primaryColor,
    textStyle: const TextStyle(fontSize: 32),
    minimumSize: const Size(200, 60),
  )),
  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
    primary: const Color.fromARGB(255, 127, 127, 127),
    textStyle: const TextStyle(fontSize: 20),
    minimumSize: const Size(200, 60),
  )),

  textTheme: const TextTheme(
    // Main app title
    headline1: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.normal,
      color: Colors.black87,
    ),
    // Level select title
    headline2: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Colors.black87,
    ),
    // Level select subtitle
    subtitle1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: Colors.black54,
    ),
  ),
);
