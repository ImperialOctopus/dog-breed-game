import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/progress/progress_bloc.dart';
import '../../../bloc/progress/progress_event.dart';
import '../../../extension/indexed_iterable.dart';
import '../../../model/level.dart';
import '../../../model/quiz/question.dart';
import '../../../model/quiz/quiz.dart';
import 'question_page.dart';
import 'result_screen.dart';

/// Screen to show a quiz.
class QuizScreen extends StatefulWidget {
  /// Level to display quiz from.
  final Level level;

  /// Screen to show a quiz.
  const QuizScreen({required this.level});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<int> chosenAnswers = [];

  late int questionIndex;
  late int score;

  Quiz get quiz => widget.level.quiz!;
  Level get level => widget.level;

  Question get currentQuestion => quiz.questions[questionIndex];
  double get progress => (questionIndex + 1) / quiz.questions.length;

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
        imagePath: currentQuestion.imagePath,
        size: currentQuestion.size,
        rarity: currentQuestion.rarity,
        answers: currentQuestion.answers.keys,
        progress: progress,
        correctAnswers: currentQuestion.answers.entries
            .mapIndexed<int?>(
                (mapEntry, index) => (mapEntry.value) ? index : null)
            .whereType<int>(),
        chosenAnswers: chosenAnswers,
        onAnswerPressed: onAnswerPressed,
        onNextPressed: onNextPressed,
      ),
    );
  }

  void onAnswerPressed(int i) {
    setState(() {
      if (currentQuestion.answers.values.elementAt(i)) {
        score += 1;
      }
      chosenAnswers = [i];
    });
  }

  void onNextPressed() {
    setState(() {
      chosenAnswers = [];
      if (questionIndex < quiz.questions.length) {
        questionIndex += 1;
        chosenAnswers = [];
      } else {
        BlocProvider.of<ProgressBloc>(context).add(QuizCompleted(
            levelId: level.id, score: score / quiz.questions.length));
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<ResultScreen>(
            builder: (context) => ResultScreen(
                title: level.title,
                score: score,
                questionNumber: quiz.questions.length),
          ),
        );
      }
    });
  }
}
