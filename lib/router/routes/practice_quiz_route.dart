import 'package:flutter/material.dart';

import '../../model/practice/practice_settings.dart';
import '../../screens/practice/practice_quiz_screen.dart';
import '../provides_page.dart';
import '../router_state.dart';
import 'practice_route.dart';

/// Practice main route.
class PracticeQuizRoute extends StatelessWidget implements ProvidesPage<void> {
  /// Settings for the quiz.
  final PracticeSettings settings;

  /// Practice main route.
  const PracticeQuizRoute({required this.settings});

  @override
  Widget build(BuildContext context) {
    return PracticeQuizScreen(settings: settings);
  }

  @override
  Page<void> get page => MaterialPage(child: this);
}

/// /practice/quiz
class PracticeQuizRouteState extends RouterState {
  /// Settings for the quiz.
  final PracticeSettings settings;

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
