import 'package:flutter/material.dart';

import '../../model/practice/practice_result.dart';
import '../../model/practice/practice_settings.dart';
import '../../screens/practice/practice_result_screen.dart';
import '../provides_page.dart';
import '../router_state.dart';
import '../transitions/default_transition.dart';
import 'practice_quiz_route.dart';
import 'practice_route.dart';

/// Practice result route.
class PracticeResultRoute extends StatelessWidget
    implements ProvidesPage<void> {
  /// Settings for the quiz.
  final PracticeSettings settings;

  /// Result from the quiz.
  final PracticeResult result;

  /// Practice main route.
  const PracticeResultRoute({required this.settings, required this.result});

  ValueKey<List<Object>> get _key => ValueKey<List<Object>>([settings, result]);

  @override
  Widget build(BuildContext context) {
    return PracticeResultScreen(settings: settings, result: result);
  }

  @override
  Page<void> get page => DefaultTransition(child: this, key: _key);
}

/// /practice/quiz/result
class PracticeResultRouteState extends RouterState {
  /// Settings for the quiz.
  final PracticeSettings settings;

  /// Result from a quiz.
  final PracticeResult result;

  /// /practice/quiz/result
  const PracticeResultRouteState(
      {required this.settings, required this.result});

  @override
  List<Page> get routes => [
        PracticeResultRoute(settings: settings, result: result).page,
        PracticeQuizRoute(settings: settings).page,
      ];

  @override
  RouterState get popsInto => const PracticeRouteState();

  @override
  List<Object?> get props => [settings, result];
}
