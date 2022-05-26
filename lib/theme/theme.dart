import 'package:flutter/material.dart';

final _baseTheme = ThemeData.from(
  colorScheme: const ColorScheme.light(
    primary: Color.fromARGB(255, 110, 20, 69),
    //primaryVariant:  Color(0xff1c313a),
    secondary: Color.fromARGB(255, 181, 51, 70),
    //secondaryVariant: Color(0xffc79400),
  ),
  textTheme: const TextTheme(
    // Main app title
    headline1: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.normal,
      //color: Colors.black87,
    ),
    // Level select title
    headline2: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      //color: Colors.black87,
    ),
    // Level select subtitle
    subtitle1: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      //color: Colors.black54,
    ),
  ),
).copyWith(
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 32),
      minimumSize: const Size(200, 60),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      minimumSize: const Size(200, 60),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: const Color.fromARGB(255, 127, 127, 127),
      textStyle: const TextStyle(fontSize: 20),
      minimumSize: const Size(200, 60),
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Color.fromARGB(255, 181, 51, 70),
  ),
);

/// Light version of the theme.
final lightTheme = _baseTheme;

/// Dark version of the theme.
final darkTheme = _baseTheme.copyWith(
  brightness: Brightness.dark,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: _baseTheme.elevatedButtonTheme.style?.merge(
      ElevatedButton.styleFrom(onPrimary: Colors.white),
    ),
  ),
);

/// App theme to use
final themeData = lightTheme;
