import 'package:flutter/material.dart';

import '../../model/practice/practice_result.dart';
import '../../model/practice/practice_settings.dart';
import 'components/settings_info_bar.dart';

/// Results from a practice quiz.
class PracticeResultScreen extends StatelessWidget {
  /// Settings for the quiz.
  final PracticeSettings settings;

  /// Result from a practice quiz.
  final PracticeResult result;

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
            Center(
                child: Text((settings.questionNumber != null)
                    ? '${result.score} / ${settings.questionNumber}'
                    : '${result.score}')),
            SettingsInfoBar(
              difficulty: settings.difficulty,
              lives: settings.lives,
              mistakes: result.mistakes,
              timeEnabled: settings.time,
            ),
          ],
        ),
      ),
    );
  }
}
