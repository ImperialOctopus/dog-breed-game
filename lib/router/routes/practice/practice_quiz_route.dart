import 'package:flutter/material.dart';

import '../../../model/quiz/quiz_settings.dart';
import '../../../screens/practice/practice_quiz_screen.dart';
import '../../provides_page.dart';
import '../../router_state.dart';
import '../../transitions/slide_left_transition.dart';
import 'practice_route.dart';

/// Practice main route.
class PracticeQuizRoute extends StatelessWidget implements ProvidesPage<void> {
  /// Settings for the quiz.
  final QuizSettings settings;

  /// Practice main route.
  const PracticeQuizRoute({required this.settings});

  LocalKey get _key => const ValueKey<Type>(PracticeQuizRoute);

  @override
  Widget build(BuildContext context) {
    return PracticeQuizScreen(settings: settings);
  }

  @override
  Page<void> get page => SlideLeftTransition(child: this, key: _key);
}

/// /practice/quiz
class PracticeQuizRouteState extends RouterState {
  /// Settings for the quiz.
  final QuizSettings settings;

  /// /practice/quiz
  const PracticeQuizRouteState({required this.settings});

  @override
  List<Page> get routes => [
        PracticeQuizRoute(settings: settings).page,
      ];

  @override
  RouterState get popsInto => const PracticeRouteState();

  @override
  List<Object?> get props => [settings];
}
