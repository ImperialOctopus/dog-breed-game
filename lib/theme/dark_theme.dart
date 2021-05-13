import 'package:flutter/material.dart';

import 'default_theme.dart';

const _primaryColor = DefaultTheme.primaryColor;
const _accentColor = DefaultTheme.accentColor;

final _outlinedButtonTheme = DefaultTheme.outlinedButtonTheme;
final _elevatedButtonTheme = DefaultTheme.elevatedButtonTheme;
final _textButtonTheme = DefaultTheme.textButtonTheme;

const _textTheme = DefaultTheme.textTheme;

const _primaryScheme = ColorScheme.dark(
  primary: _primaryColor,
  primaryVariant: _primaryColor,
  secondary: _accentColor,
  secondaryVariant: _accentColor,
);

/// Default app theme
final darkTheme = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.dark,
  primaryColor: _primaryColor,
  accentColor: _accentColor,
  textSelectionTheme: const TextSelectionThemeData(cursorColor: _accentColor),

  colorScheme: _primaryScheme,

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: _outlinedButtonTheme,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: _elevatedButtonTheme.merge(
      ElevatedButton.styleFrom(onPrimary: Colors.white),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: _textButtonTheme,
  ),

  textTheme: _textTheme,
);
