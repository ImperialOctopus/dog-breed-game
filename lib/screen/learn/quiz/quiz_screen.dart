import 'package:flutter/material.dart';

import '../../../model/quiz/quiz.dart';
import 'question_page.dart';

/// Screen to show a quiz.
class QuizScreen extends StatefulWidget {
  /// Quiz to show.
  final Quiz quiz;

  /// Const constructor.
  const QuizScreen({required this.quiz});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? chosenAnswer;
  double progress = 0.4;
  String imagePath = 'assets/sample/labrador.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: QuestionPage(
        imagePath: imagePath,
        size: 'Large',
        rarity: 'Rare',
        answers: [
          'Labrador',
          'Cat',
          'Pug',
          'Golden Retriever',
        ],
        progress: progress,
        correctAnswer: 0,
        chosenAnswer: chosenAnswer,
        onAnswerPressed: (i) => setState(() {
          chosenAnswer = i;
          progress = 0.5;
          imagePath = 'assets/sample/kiss.jpg';
        }),
        onNextPressed: () {},
      ),
    );
  }
}
