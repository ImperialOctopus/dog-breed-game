import 'package:flutter/material.dart';

/// Button theme for correct answer.
final OutlinedButtonThemeData answerCorrectStyle = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
  primary: Colors.white,
  backgroundColor: Colors.green.shade700,
  textStyle: const TextStyle(fontSize: 32),
  minimumSize: const Size(200, 60),
));

/// Button theme for incorrect answer.
final OutlinedButtonThemeData answerIncorrectStyle = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
  primary: Colors.white,
  backgroundColor: const Color.fromARGB(255, 181, 51, 70),
  textStyle: const TextStyle(fontSize: 32),
  minimumSize: const Size(200, 60),
));

/// Button theme for other answers.
final OutlinedButtonThemeData answerDefaultStyle = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
  primary: const Color.fromARGB(255, 181, 51, 70),
  textStyle: const TextStyle(fontSize: 32),
  minimumSize: const Size(200, 60),
));
