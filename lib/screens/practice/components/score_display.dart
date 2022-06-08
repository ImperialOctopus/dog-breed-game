import 'package:flutter/material.dart';

/// Display for score in results page.
class ScoreDisplay extends StatelessWidget {
  /// Number of questions given.
  final int? questionNumber;

  /// Number of questions answered correctly.
  final int score;

  /// Display for score in results page.
  const ScoreDisplay({required this.questionNumber, required this.score});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
          (questionNumber != null) ? '$score / $questionNumber' : '$score'),
    );
  }
}
