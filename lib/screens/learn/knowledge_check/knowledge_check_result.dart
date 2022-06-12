import 'package:flutter/material.dart';

import '../../../../../components/level_header.dart';
import '../../../../model/learn/knowledge_check.dart';
import '../../../model/quiz/quiz_result.dart';

/// Screen to show results of quiz.
class KnowledgeCheckResultScreen extends StatelessWidget {
  /// Level this is the result for.
  final KnowledgeCheck knowledgeCheck;

  /// Score.
  final QuizResult result;

  /// Screen to show results of quiz.
  const KnowledgeCheckResultScreen({
    required this.knowledgeCheck,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LevelHeader(
              leading: Hero(
                tag: knowledgeCheck,
                child: Image.asset(knowledgeCheck.imagePath, fit: BoxFit.cover),
              ),
              title: knowledgeCheck.title,
              subtitle: knowledgeCheck.subtitle,
            ),
            const Spacer(),
            const Text('Your Score:'),
            Text(
              ((result.score / knowledgeCheck.quizSettings.questionNumber!) *
                          100)
                      .toStringAsFixed(0) +
                  '%',
              style: Theme.of(context).textTheme.headline2,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
