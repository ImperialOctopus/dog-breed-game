import 'package:flutter/material.dart';

/// Screen to set up a practice quiz.
class QuizSettingsScreen extends StatelessWidget {
  /// Screen to set up a practice quiz.
  const QuizSettingsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Divider(
            color: Theme.of(context).primaryColor,
            height: 0,
            thickness: 2,
          ),
          Expanded(
            child: ListView(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}
