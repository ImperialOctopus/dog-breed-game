import 'package:flutter/material.dart';

import 'default_theme.dart';

/// Light version of the theme.
final lightTheme = defaultTheme.copyWith(
  brightness: Brightness.light,
);

/// Dark version of the theme.
final darkTheme = defaultTheme.copyWith(
  brightness: Brightness.dark,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: defaultTheme.elevatedButtonTheme.style?.merge(
      ElevatedButton.styleFrom(onPrimary: Colors.white),
    ),
  ),
);

/// Default app theme
final themeData = darkTheme;
