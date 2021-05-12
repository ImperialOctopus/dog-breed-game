import 'package:flutter/material.dart';

import '../../model/level/quiz.dart';
import '../../model/quiz_result.dart';
import '../../screen/learn/level/result_screen.dart';
import '../provides_page.dart';

/// Route for quiz results.
class ResultRoute extends StatelessWidget implements ProvidesPage<void> {
  /// Quiz that this is the result for.
  final Quiz quiz;

  /// Score.
  final QuizResult result;

  /// Route for quiz results.
  const ResultRoute({required this.quiz, required this.result});

  @override
  Widget build(BuildContext context) {
    return ResultScreen(quiz: quiz, result: result);
  }

  @override
  Page<void> get page => MaterialPage(child: this);
}
