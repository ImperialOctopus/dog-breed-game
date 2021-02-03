import 'package:flutter/material.dart';

/// Question for a quiz.
class Question {
  /// Image path.
  final String imagePath;

  /// List of potential answers.
  final List<String> answers;

  /// Correct answer index.
  final int correctAnswer;

  /// Size of dog.
  final Widget? size;

  /// Rarity of dog.
  final Widget? rarity;

  /// Const constructor.
  const Question({
    required this.imagePath,
    required this.answers,
    required this.correctAnswer,
    this.size,
    this.rarity,
  });
}
