import '../../model/questions/image_id_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/progress/progress_cubit.dart';
import '../../../model/level/quiz.dart';
import '../../../model/quiz_result.dart';
import '../../../theme/animation.dart';
import '../../model/progress/level_scored.dart';
import '../../model/questions/question.dart';
import 'image_id_question_page.dart';
import '../learn/quiz/quiz_intro_page.dart';
import '../learn/quiz/result_page.dart';

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
  bool currentQuestionAnswered = false;

  late QuizScreenPage page;

  late int questionIndex;
  late int score;

  Quiz get quiz => widget.quiz;

  Question get currentQuestion => quiz.questions[questionIndex];
  double get progress =>
      (questionIndex + (currentQuestionAnswered ? 1 : 0)) /
      quiz.questions.length;

  static const _introSwitchDuration = quizSwitcherDuration;

  @override
  void initState() {
    super.initState();
    page = QuizScreenPage.intro;
    questionIndex = 0;
    score = 0;
  }

  void onQuestionAnswered(bool correct) {
    setState(() {
      if (correct) {
        score += 1;
      }
      currentQuestionAnswered = true;
    });
  }

  void onNextPressed() {
    setState(() {
      currentQuestionAnswered = false;

      if (questionIndex + 1 < quiz.questions.length) {
        questionIndex += 1;
      } else {
        BlocProvider.of<ProgressCubit>(context).updateProgress(
          widget.quiz,
          LevelScored(score, widget.quiz.questions.length),
        );
        page = QuizScreenPage.results;
      }
    });
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
      child: _buildChild(page),
    );
  }

  Widget _buildChild(QuizScreenPage page) {
    if (page == QuizScreenPage.intro) {
      return QuizIntroPage(
        quiz: quiz,
        onNext: () => setState(() {
          page = QuizScreenPage.quiz;
        }),
      );
    }
    if (page == QuizScreenPage.quiz) {
      return _buildQuestionPage(currentQuestion);
    }
    if (page == QuizScreenPage.results) {
      return ResultPage(
        quiz: quiz,
        result: QuizResult(
          maxScore: quiz.questions.length,
          score: score,
        ),
      );
    }
    throw FallThroughError();
  }

  Widget _buildQuestionPage(Question question) {
    if (question is ImageIdQuestion) {
      return ImageIdQuestionPage(
        question: question,
        progress: progress,
        onQuestionAnswered: onQuestionAnswered,
        onNextPressed: onNextPressed,
      );
    }
    throw FallThroughError();
  }
}
