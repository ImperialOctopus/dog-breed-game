import 'package:flutter/material.dart';

import '../../model/practice/practice_settings.dart';

/// Screen for the practice quiz.
class PracticeQuizScreen extends StatelessWidget {
  /// Settings for the quiz to play.
  final PracticeSettings settings;

  /// Screen for the practice quiz.
  const PracticeQuizScreen({required this.settings});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: Text('Quoz')),
    );
  }
}
