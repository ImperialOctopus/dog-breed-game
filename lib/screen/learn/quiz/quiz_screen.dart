import 'package:flutter/material.dart';

import '../../../model/quiz/quiz.dart';
import 'question_page.dart';
import '../../../extension/indexed_iterable.dart';

/// Screen to show a quiz.
class QuizScreen extends StatefulWidget {
  /// Quiz to show.
  final Quiz quiz;

  /// Screen to show a quiz.
  const QuizScreen({required this.quiz});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late int questionIndex;
  List<int> chosenAnswer = [];

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
        imagePath: widget.quiz.questions[questionIndex].imagePath,
        size: widget.quiz.questions[questionIndex].size,
        rarity: widget.quiz.questions[questionIndex].rarity,
        answers: widget.quiz.questions[questionIndex].answers.keys,
        progress: 0.4,
        correctAnswers: widget.quiz.questions[questionIndex].answers.entries
            .mapIndexed<int?>(
                (mapEntry, index) => (mapEntry.value) ? index : null)
            .whereType<int>(),
        chosenAnswers: chosenAnswer,
        onAnswerPressed: (i) => setState(() {}),
        onNextPressed: () {},
      ),
    );
  }

  void onAnswerPressed(int i) {
    setState(() {
      chosenAnswer = [i];
    });
  }

  void onNextPressed() {
    setState(() {
      chosenAnswer = [];
      questionIndex += 1;
    });
  }
}
