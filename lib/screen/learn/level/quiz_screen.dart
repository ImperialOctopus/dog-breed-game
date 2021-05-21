import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/progress/progress_cubit.dart';
import '../../../../model/level/question.dart';
import '../../../../model/level/quiz.dart';
import '../../../../model/quiz_result.dart';
import '../../../../theme/animation.dart';
import '../../../model/progress/level_scored.dart';
import 'question_page.dart';
import 'quiz_intro_page.dart';
import 'result_page.dart';

/// State for quiz screen.
enum QuizScreenPage {
  /// Introduction page.
  intro,

  /// Page containing questions.
  quiz,

  /// Results page.
  results,
}

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

  late QuizScreenPage page;

  late int questionIndex;
  late int score;

  Quiz get quiz => widget.quiz;

  Question get currentQuestion => quiz.questions[questionIndex];
  double get progress =>
      (questionIndex + ((chosenAnswer == null) ? 0 : 1)) /
      quiz.questions.length;

  static const _introSwitchDuration = quizSwitcherDuration;

  @override
  void initState() {
    super.initState();
    page = QuizScreenPage.intro;
    questionIndex = 0;
    score = 0;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: _introSwitchDuration,
      transitionBuilder: (child, animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child,
        );
      },
      switchOutCurve: const Threshold(0),
      switchInCurve: Curves.ease,
      child: () {
        switch (page) {
          case QuizScreenPage.intro:
            return QuizIntroPage(
              quiz: quiz,
              onNext: () => setState(() {
                page = QuizScreenPage.quiz;
              }),
            );
          case QuizScreenPage.quiz:
            return QuestionPage(
              question: currentQuestion,
              progress: progress,
              chosenAnswer: chosenAnswer,
              onAnswerPressed: onAnswerPressed,
              onNextPressed: onNextPressed,
            );
          case QuizScreenPage.results:
            return ResultPage(
              quiz: quiz,
              result: QuizResult(
                maxScore: quiz.questions.length,
                score: score,
              ),
            );
        }
      }(),
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
    if (questionIndex + 1 < quiz.questions.length) {
      setState(() {
        questionIndex += 1;
        chosenAnswer = null;
      });
    } else {
      BlocProvider.of<ProgressCubit>(context).updateProgress(
        widget.quiz,
        LevelScored(score, widget.quiz.questions.length),
      );
      setState(() {
        page = QuizScreenPage.results;
      });
    }
  }
}
