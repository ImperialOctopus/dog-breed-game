import 'package:flutter/material.dart';

/// Screen to show results of quiz.
class ResultScreen extends StatelessWidget {
  /// Quiz title.
  final String title;

  /// Score they got.
  final int score;

  /// Total number of questions.
  final int questionNumber;

  /// Screen to show results of quiz.
  const ResultScreen({
    required this.title,
    required this.score,
    required this.questionNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(title),
          Text(score.toString()),
          Text(questionNumber.toString()),
        ],
      ),
    );
  }
}
