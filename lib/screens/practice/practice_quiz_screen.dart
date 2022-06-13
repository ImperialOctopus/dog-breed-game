import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/questions/question_forms/question.dart';
import '../../model/quiz/quiz_end_state.dart';
import '../../model/quiz/quiz_result.dart';
import '../../model/quiz/quiz_settings.dart';
import '../../repositories/question_generator.dart';
import '../../router/actions/router_end_practice.dart';
import '../../router/router_bloc.dart';
import '../../theme/animation.dart';
import '../question_page/question_page.dart';
import 'components/settings_info_bar.dart';

/// Screen for the practice quiz.
class PracticeQuizScreen extends StatefulWidget {
  /// Settings for the quiz to play.
  final QuizSettings settings;

  /// Screen for the practice quiz.
  const PracticeQuizScreen({required this.settings});

  @override
  _PracticeQuizScreenState createState() => _PracticeQuizScreenState();
}

class _PracticeQuizScreenState extends State<PracticeQuizScreen> {
  late final QuestionGenerator questionGenerator;
  late Question currentQuestion;

  QuizEndState endState = QuizEndState.notFinished;
  int questionsAnswered = 0;
  int mistakesMade = 0;

  double get progress => widget.settings.questionNumber != null
      ? questionsAnswered / widget.settings.questionNumber!
      : 0;

  static const _introSwitchDuration = AnimationTheme.quizSwitcherDuration;

  @override
  void initState() {
    super.initState();

    questionGenerator =
        QuestionGenerator.fromCategories(widget.settings.categories);
    getNewQuestion();
  }

  void getNewQuestion() {
    currentQuestion = questionGenerator.generateRandomQuestion();
  }

  void onQuestionAnswered(bool correct) {
    setState(() {
      if (!correct) {
        mistakesMade += 1;

        if (widget.settings.lives != null &&
            mistakesMade >= widget.settings.lives!) {
          // ran out of lives
          endState = QuizEndState.outOfLives;
        }
      }
      questionsAnswered += 1;

      if (widget.settings.questionNumber != null &&
          questionsAnswered >= widget.settings.questionNumber!) {
        // ran out of questions
        endState = QuizEndState.outOfQuestions;
      }
    });
  }

  void onTimeExpires() {
    setState(() {
      endState = QuizEndState.outOfTime;
    });
  }

  void onConcedePressed() {
    endState = QuizEndState.userCondeded;
    onNextPressed();
  }

  void onNextPressed() {
    if (endState != QuizEndState.notFinished) {
      setState(() {
        BlocProvider.of<RouterBloc>(context).add(
          RouterEndPractice(
              settings: widget.settings,
              result: QuizResult(
                mistakes: mistakesMade,
                score: questionsAnswered - mistakesMade,
                endState: endState,
              )),
        );
      });
      return;
    }
    setState(() {
      getNewQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: onConcedePressed, icon: const Icon(Icons.cancel)),
      ]),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: AnimatedSwitcher(
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
                  key: ValueKey(currentQuestion),
                  question: currentQuestion,
                  progress: progress,
                  quizOver: endState != QuizEndState.notFinished,
                  onQuestionAnswered: onQuestionAnswered,
                  nextButtonContent: endState == QuizEndState.notFinished
                      ? const Text('Next')
                      : const Text('Results'),
                  onNextPressed: onNextPressed,
                ),
              ),
            ),
            SettingsInfoBar(
              lives: widget.settings.lives,
              mistakes: mistakesMade,
            ),
          ],
        ),
      ),
    );
  }
}
