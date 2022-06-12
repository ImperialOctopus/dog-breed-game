import 'package:flutter/material.dart';

import '../../../model/quiz/quiz_result.dart';
import '../../../model/quiz/quiz_settings.dart';
import '../../../screens/practice/practice_result_screen.dart';
import '../../provides_page.dart';
import '../../router_state.dart';
import 'practice_route.dart';

/// Practice result route.
class PracticeResultRoute extends StatelessWidget with ProvidesPage<void> {
  /// Settings for the quiz.
  final QuizSettings settings;

  /// Result from the quiz.
  final QuizResult result;

  /// Practice main route.
  const PracticeResultRoute({required this.settings, required this.result});

  @override
  Widget build(BuildContext context) {
    return PracticeResultScreen(settings: settings, result: result);
  }
}

/// /practice/quiz/result
class PracticeResultRouteState extends RouterState {
  /// Settings for the quiz.
  final QuizSettings settings;

  /// Result from a quiz.
  final QuizResult result;

  /// /practice/quiz/result
  const PracticeResultRouteState(
      {required this.settings, required this.result});

  @override
  List<Page> get routes => [
        //PracticeQuizRoute(settings: settings).page,
        PracticeResultRoute(settings: settings, result: result).page,
      ];

  @override
  RouterState get popsInto => const PracticeRouteState();

  @override
  List<Object?> get props => [settings, result];
}
