import 'package:flutter/material.dart';

import '../../model/level/quiz.dart';
import '../../screen/learn/level/quiz_screen.dart';
import '../provides_page.dart';

/// Route for a level.
class QuizRoute extends StatelessWidget implements ProvidesPage<void> {
  /// Level to display.
  final Quiz quiz;

  /// Route for a level.
  const QuizRoute({required this.quiz});

  @override
  Widget build(BuildContext context) {
    return QuizScreen(quiz: quiz);
  }

  @override
  Page<void> get page => MaterialPage(child: this);
}
