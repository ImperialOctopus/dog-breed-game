import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/level/question.dart';
import '../../../model/level/quiz.dart';
import '../../../model/quiz_result.dart';
import '../../../model/world.dart';
import '../../../routes/bloc/router_bloc.dart';
import '../../../routes/bloc/router_event.dart';
import 'question_page.dart';

/// Screen to show a quiz.
class QuizScreen extends StatefulWidget {
  /// World that owns this quiz.
  final World world;

  /// Quiz to display.
  final Quiz quiz;

  /// Screen to show a quiz.
  const QuizScreen({required this.world, required this.quiz});

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
      BlocProvider.of<RouterBloc>(context).add(
        RouterEventQuizResults(
            quiz: quiz,
            result: QuizResult(
              maxScore: quiz.questions.length,
              score: score,
            )),
      );
    }
  }
}
