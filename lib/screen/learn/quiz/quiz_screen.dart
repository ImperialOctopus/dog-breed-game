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
  late int questionIndex;

  @override
  void initState() {
    super.initState();
    questionIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: QuestionPage(
        imagePath: '',
        size: 'Large',
        rarity: 'Rare',
        answers: [
          'Labrador',
          'Cat',
          'Pug',
          'Golden Retriever',
        ],
        progress: 0.4,
        correctAnswers: [0],
        chosenAnswers: [],
        onAnswerPressed: (i) => setState(() {}),
        onNextPressed: () {},
      ),
    );
  }
}
