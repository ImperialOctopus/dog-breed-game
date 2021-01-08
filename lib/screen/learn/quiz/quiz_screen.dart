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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: QuestionPage(
        imagePath: 'assets/sample/labrador.jpg',
        size: 'Large',
        rarity: 'Rare',
        answers: [
          '1',
          '2',
          '3',
          '4',
        ],
        progress: 0.4,
        onAnswerPressed: (i) => setState(() {
          print(i);
          chosenAnswer = i;
        }),
        correctAnswer: 0,
        chosenAnswer: chosenAnswer,
      ),
    );
  }
}
