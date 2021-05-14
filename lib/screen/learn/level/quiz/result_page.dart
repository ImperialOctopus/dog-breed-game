import 'package:flutter/material.dart';

import '../../../../components/level_header.dart';
import '../../../../model/level/quiz.dart';
import '../../../../model/quiz_result.dart';

/// Screen to show results of quiz.
class ResultPage extends StatelessWidget {
  /// Level this is the result for.
  final Quiz quiz;

  /// Score.
  final QuizResult result;

  /// Screen to show results of quiz.
  const ResultPage({
    required this.quiz,
    required this.result,
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
            leading: Hero(
              tag: quiz,
              child: Image.asset(quiz.imagePath, fit: BoxFit.cover),
            ),
            title: quiz.title,
            subtitle: quiz.subtitle,
          ),
          const Spacer(),
          const Text('Your Score:'),
          Text(
            ((result.score / result.maxScore) * 100).toStringAsFixed(0) + '%',
            style: Theme.of(context).textTheme.headline2,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}