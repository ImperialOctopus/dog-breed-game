import 'package:flutter/material.dart';

import '../../../model/quiz/quiz.dart';

/// Screen to show a quiz.
class QuizScreen extends StatelessWidget {
  /// Quiz to show.
  final Quiz quiz;

  /// Const constructor.
  const QuizScreen({required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(quiz.questions.toString())),
    );
  }
}
