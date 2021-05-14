import 'package:flutter/material.dart';

/// App's default theme.
class DefaultTheme {
  /// Primary colour.
  static const primaryColor = Color.fromARGB(255, 110, 20, 69);

  /// Accent colour.
  static const accentColor = Color.fromARGB(255, 181, 51, 70);

  /// Text theme.
  static const textTheme = TextTheme(
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
  );

  /// Outlined button theme.
  static final outlinedButtonTheme = OutlinedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 32),
    minimumSize: const Size(200, 60),
  );

  /// Elevated button theme.
  static final elevatedButtonTheme = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 20),
    minimumSize: const Size(200, 60),
  );

  /// Text button theme.
  static final textButtonTheme = TextButton.styleFrom(
    primary: const Color.fromARGB(255, 127, 127, 127),
    textStyle: const TextStyle(fontSize: 20),
    minimumSize: const Size(200, 60),
  );
}
