import 'package:flutter/material.dart';

import '../../model/practice/practice_result.dart';
import '../../model/practice/practice_settings.dart';

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
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(child: Text(result.toString())),
      ),
    );
  }
}
