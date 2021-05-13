import 'package:flutter/material.dart';

import 'default_theme.dart';

const _primaryColor = DefaultTheme.primaryColor;
const _accentColor = DefaultTheme.accentColor;

final _outlinedButtonTheme = DefaultTheme.outlinedButtonTheme;
final _elevatedButtonTheme = DefaultTheme.elevatedButtonTheme;
final _textButtonTheme = DefaultTheme.textButtonTheme;

const _textTheme = DefaultTheme.textTheme;

const _primaryScheme = ColorScheme.light(
  primary: _primaryColor,
  primaryVariant: _primaryColor,
  secondary: _accentColor,
  secondaryVariant: _accentColor,
);

/// Default app theme
final lightTheme = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.light,
  primaryColor: _primaryColor,
  accentColor: _accentColor,
  textSelectionTheme: const TextSelectionThemeData(cursorColor: _accentColor),

  colorScheme: _primaryScheme,

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: _outlinedButtonTheme,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: _elevatedButtonTheme,
  ),
  textButtonTheme: TextButtonThemeData(
    style: _textButtonTheme,
  ),

  textTheme: _textTheme,
);
