import 'package:flutter/material.dart';

import '../../model/quiz/quiz_result.dart';
import '../../model/quiz/quiz_settings.dart';
import 'components/settings_info_bar.dart';

/// Results from a practice quiz.
class PracticeResultScreen extends StatelessWidget {
  /// Settings for the quiz.
  final QuizSettings settings;

  /// Result from a practice quiz.
  final QuizResult result;

  /// Results from a practice quiz.
  const PracticeResultScreen({required this.settings, required this.result});

  @override
  Widget build(BuildContext context) {
    //result.practiceEndState

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Center(
              child: Column(
                children: [
                  const Text('Quiz over! Your score was: '),
                  Text(
                      (settings.questionNumber != null)
                          ? '${result.score} / ${settings.questionNumber}'
                          : '${result.score}',
                      style: const TextStyle(fontSize: 60)),
                ],
              ),
            ),
            const Spacer(),
            SettingsInfoBar(
              lives: settings.lives,
              mistakes: result.mistakes,
            ),
          ],
        ),
      ),
    );
  }
}
