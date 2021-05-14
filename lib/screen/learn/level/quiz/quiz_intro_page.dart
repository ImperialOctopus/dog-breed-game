import 'package:flutter/material.dart';

import '../../../../model/level/quiz.dart';

/// Intro page for quiz.
class QuizIntroPage extends StatelessWidget {
  /// Quiz this introduces.
  final Quiz quiz;

  /// Callback for next button is pressed.
  final VoidCallback onNext;

  /// Intro page for quiz.
  const QuizIntroPage({required this.quiz, required this.onNext});

  static const double _headerImageHeight = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: _headerImageHeight,
            child: Hero(
              tag: quiz,
              child: Image.asset(quiz.imagePath, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(quiz.title),
                if (quiz.subtitle != null) Text(quiz.subtitle!),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Center(
              child: ElevatedButton(
                onPressed: onNext,
                child: const Text('Start'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
