import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/practice/practice_settings.dart';
import '../../model/questions/question.dart';
import '../../repository/question/question_repository.dart';
import '../../router/actions/router_pop.dart';
import '../../router/router_bloc.dart';
import '../../theme/animation.dart';
import '../question_page/question_page.dart';

/// Screen for the practice quiz.
class PracticeQuizScreen extends StatefulWidget {
  /// Settings for the quiz to play.
  final PracticeSettings settings;

  /// Screen for the practice quiz.
  const PracticeQuizScreen({required this.settings});

  @override
  _PracticeQuizScreenState createState() => _PracticeQuizScreenState();
}

class _PracticeQuizScreenState extends State<PracticeQuizScreen> {
  int get questionNumber => widget.settings.questionNumber;
  int get difficulty => widget.settings.difficulty;
  int get lives => widget.settings.lives;

  late final Question Function() questionGenerator;
  late Question currentQuestion;

  int questionsAnswered = 0;
  int mistakesMade = 0;

  double get progress =>
      questionNumber == 0 ? 0 : questionsAnswered / questionNumber;

  static const _introSwitchDuration = AnimationTheme.quizSwitcherDuration;

  @override
  void initState() {
    super.initState();

    questionGenerator = RepositoryProvider.of<QuestionRepository>(context)
        .getQuestionGenerator(difficulty: difficulty);
    currentQuestion = questionGenerator();
  }

  void onQuestionAnswered(bool correct) {
    setState(() {
      if (!correct) {
        mistakesMade += 1;
      }
      questionsAnswered += 1;
    });
  }

  void onNextPressed() {
    setState(() {
      if (lives > 0 && mistakesMade >= lives) {
        // ran out of lives
        BlocProvider.of<RouterBloc>(context).add(const RouterPop());
        return;
      }
      if (questionNumber > 0 && questionsAnswered >= questionNumber) {
        // ran out of questions
        BlocProvider.of<RouterBloc>(context).add(const RouterPop());
        return;
      }
      // Move on to next question.
      currentQuestion = questionGenerator();
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
      child: QuestionPage(
        question: currentQuestion,
        progress: progress,
        onNextPressed: onNextPressed,
        onQuestionAnswered: onQuestionAnswered,
      ),
    );
  }
}
