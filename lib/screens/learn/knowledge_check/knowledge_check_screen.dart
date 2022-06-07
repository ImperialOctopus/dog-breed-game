import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../bloc/progress/progress_cubit.dart';
import '../../../../../theme/animation.dart';
import '../../../../model/level/knowledge_check.dart';
import '../../../../model/level/knowledge_check_result.dart';
import '../../../../model/progress/level_scored.dart';
import '../../../../model/questions/question.dart';
import '../../question_page/question_page.dart';
import 'knowledge_check_intro_page.dart';
import 'knowledge_check_result_page.dart';

/// State for knowledge check screen.
enum KnowledgeCheckState {
  /// Introduction page.
  intro,

  /// Page containing questions.
  questions,

  /// Results page.
  results,
}

/// Screen to show a quiz.
class KnowledgeCheckScreen extends StatefulWidget {
  /// Knowledge check to display.
  final KnowledgeCheck knowledgeCheck;

  /// Screen to show a knowledge check.
  const KnowledgeCheckScreen({required this.knowledgeCheck});

  @override
  _KnowledgeCheckScreenState createState() => _KnowledgeCheckScreenState();
}

class _KnowledgeCheckScreenState extends State<KnowledgeCheckScreen> {
  bool currentQuestionAnswered = false;

  late KnowledgeCheckState page;

  late int questionIndex;
  late int score;

  Question get currentQuestion =>
      widget.knowledgeCheck.questions[questionIndex];
  double get progress =>
      (questionIndex + (currentQuestionAnswered ? 1 : 0)) /
      widget.knowledgeCheck.questions.length;

  static const _introSwitchDuration = AnimationTheme.quizSwitcherDuration;

  @override
  void initState() {
    super.initState();
    page = KnowledgeCheckState.intro;
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

      if (questionIndex + 1 < widget.knowledgeCheck.questions.length) {
        questionIndex += 1;
      } else {
        BlocProvider.of<ProgressCubit>(context).updateProgress(
          widget.knowledgeCheck,
          LevelScored(score, widget.knowledgeCheck.questions.length),
        );
        page = KnowledgeCheckState.results;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AnimatedSwitcher(
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
      ),
    );
  }

  Widget _buildChild(KnowledgeCheckState state) {
    if (state == KnowledgeCheckState.intro) {
      return KnowledgeCheckIntroPage(
        knowledgeCheck: widget.knowledgeCheck,
        onNext: () => setState(() {
          page = KnowledgeCheckState.questions;
        }),
      );
    }
    if (page == KnowledgeCheckState.questions) {
      return QuestionPage(
        question: currentQuestion,
        progress: progress,
        onQuestionAnswered: onQuestionAnswered,
        nextButtonContent:
            questionIndex + 1 == widget.knowledgeCheck.questions.length
                ? const Text('Results')
                : const Text('Next'),
        onNextPressed: onNextPressed,
      );
    }
    if (page == KnowledgeCheckState.results) {
      return KnowledgeCheckResultPage(
        knowledgeCheck: widget.knowledgeCheck,
        result: KnowledgeCheckResult(
          maxScore: widget.knowledgeCheck.questions.length,
          score: score,
        ),
      );
    }
    throw FallThroughError();
  }
}
