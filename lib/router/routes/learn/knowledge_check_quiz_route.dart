import 'package:flutter/material.dart';

import '../../../model/learn/knowledge_check.dart';
import '../../../model/learn/world.dart';
import '../../../screens/practice/practice_quiz_screen.dart';
import '../../provides_page.dart';
import '../../router_state.dart';
import '../../transitions/slide_left_transition.dart';
import 'knowledge_check_intro_route.dart';

/// Knowledge check quiz.
class KnowledgeCheckQuizRoute extends StatelessWidget with ProvidesPage<void> {
  /// World this is a child of.
  final World? world;

  /// Settings for the quiz.
  final KnowledgeCheck knowledgeCheck;

  /// Practice main route.
  const KnowledgeCheckQuizRoute(
      {required this.world, required this.knowledgeCheck});

  @override
  Page<void> get page => SlideLeftTransition(child: this);

  @override
  Widget build(BuildContext context) {
    return PracticeQuizScreen(settings: knowledgeCheck.quizSettings);
  }
}

/// /learn/{world}/{knowledgeCheck}
class KnowledgeCheckQuizRouteState extends RouterState {
  /// World this is a child of.
  final World? world;

  /// Settings for the quiz.
  final KnowledgeCheck knowledgeCheck;

  /// /learn/{world}/{knowledgeCheck}
  const KnowledgeCheckQuizRouteState(
      {required this.world, required this.knowledgeCheck});

  @override
  List<Page> get routes => [
        KnowledgeCheckQuizRoute(world: world, knowledgeCheck: knowledgeCheck)
            .page,
      ];

  @override
  RouterState get popsInto =>
      KnowledgeCheckIntroRouteState(knowledgeCheck: knowledgeCheck);

  @override
  List<Object?> get props => [world, knowledgeCheck];
}
