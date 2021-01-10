import '../../../component/level_header.dart';
import '../../../model/level.dart';
import 'package:flutter/material.dart';

/// Screen to show results of quiz.
class ResultScreen extends StatelessWidget {
  /// Level this is the result for.
  final Level level;

  /// Score they got.
  final int score;

  /// Screen to show results of quiz.
  const ResultScreen({
    required this.level,
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
            iconData: level.iconData,
            title: level.title,
            subtitle: level.subtitle,
          ),
          const Spacer(),
          const Text('Your Score:'),
          Text(
            ((score / level.quiz!.questions.length) * 100).toStringAsFixed(0) +
                '%',
            style: Theme.of(context).textTheme.headline2,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
