import 'package:flutter/material.dart';

import '../../model/level/quiz.dart';
import '../../screen/learn/level/result_screen.dart';
import '../provides_page.dart';

/// Route for quiz results.
class ResultRoute extends StatelessWidget implements ProvidesPage<void> {
  /// Quiz that this is the result for.
  final Quiz quiz;

  /// Score.
  final int score;

  /// Route for quiz results.
  const ResultRoute({required this.quiz, required this.score});

  @override
  Widget build(BuildContext context) {
    return ResultScreen(quiz: quiz, score: score);
  }

  @override
  Page<void> get page => MaterialPage(child: this);
}
