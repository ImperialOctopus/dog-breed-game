import 'package:flutter/material.dart';

import '../../../component/level_header.dart';
import '../../../model/level/quiz.dart';

/// Screen to show results of quiz.
class ResultScreen extends StatelessWidget {
  /// Level this is the result for.
  final Quiz quiz;

  /// Score they got.
  final int score;

  /// Screen to show results of quiz.
  const ResultScreen({
    required this.quiz,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LevelHeader(
            icon: quiz.icon,
            title: quiz.title,
            subtitle: quiz.subtitle,
          ),
          const Spacer(),
          const Text('Your Score:'),
          Text(
            ((score / quiz.questions.length) * 100).toStringAsFixed(0) + '%',
            style: Theme.of(context).textTheme.headline2,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
