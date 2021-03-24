import 'package:flutter/material.dart';

import '../../../model/level/question.dart';
import '../../../model/level/quiz.dart';
import 'question_page.dart';
import 'result_screen.dart';

/// Screen to show a quiz.
class QuizScreen extends StatefulWidget {
  /// Quiz to display.
  final Quiz quiz;

  /// Screen to show a quiz.
  const QuizScreen({required this.quiz});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? chosenAnswer;

  late int questionIndex;
  late int score;

  Quiz get quiz => widget.quiz;

  Question get currentQuestion => quiz.questions[questionIndex];
  double get progress =>
      (questionIndex + ((chosenAnswer == null) ? 0 : 1)) /
      quiz.questions.length;

  @override
  void initState() {
    super.initState();
    questionIndex = 0;
    score = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: QuestionPage(
        question: currentQuestion,
        progress: progress,
        chosenAnswer: chosenAnswer,
        onAnswerPressed: onAnswerPressed,
        onNextPressed: onNextPressed,
      ),
    );
  }

  void onAnswerPressed(int i) {
    if (chosenAnswer == null) {
      setState(() {
        if (currentQuestion.correctAnswer == i) {
          score += 1;
        }
        chosenAnswer = i;
      });
    }
  }

  void onNextPressed() {
    if (questionIndex < quiz.questions.length - 1) {
      setState(() {
        questionIndex += 1;
        chosenAnswer = null;
      });
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute<ResultScreen>(
          builder: (context) => ResultScreen(
            quiz: quiz,
            score: score,
          ),
        ),
      );
    }
  }
}
