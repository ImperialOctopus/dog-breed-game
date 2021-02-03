import 'package:flutter/material.dart';

import 'level.dart';
import 'question.dart';

/// Data for a quiz.
class Quiz extends Level {
  /// List of questions.
  final List<Question> questions;

  /// Data for a quiz.
  const Quiz({
    required int id,
    required Widget icon,
    required Widget title,
    Widget? subtitle,
    required this.questions,
  }) : super(
          id: id,
          icon: icon,
          title: title,
          subtitle: subtitle,
        );
}
