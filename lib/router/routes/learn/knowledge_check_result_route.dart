import 'package:flutter/material.dart';

import '../../../model/learn/knowledge_check.dart';
import '../../../model/learn/world.dart';
import '../../../model/quiz/quiz_result.dart';
import '../../../screens/learn/knowledge_check/knowledge_check_result.dart';
import '../../provides_page.dart';
import '../../router_state.dart';
import 'level_select_route.dart';

/// Knowledge check result.
class KnowledgeCheckResultRoute extends StatelessWidget
    with ProvidesPage<void> {
  /// World this is a child of.
  final World world;

  /// Settings for the quiz.
  final KnowledgeCheck knowledgeCheck;

  /// Result to display.
  final QuizResult result;

  /// Knowledge check result.
  const KnowledgeCheckResultRoute(
      {required this.world,
      required this.knowledgeCheck,
      required this.result});

  @override
  Widget build(BuildContext context) {
    return KnowledgeCheckResultScreen(
        knowledgeCheck: knowledgeCheck, result: result);
  }
}

/// /learn/{world}/{knowledgeCheck}
class KnowledgeCheckResultRouteState extends RouterState {
  /// World this is a child of.
  final World world;

  /// Settings for the quiz.
  final KnowledgeCheck knowledgeCheck;

  /// Result to display.
  final QuizResult result;

  /// /learn/{world}/{knowledgeCheck}
  const KnowledgeCheckResultRouteState(
      {required this.world,
      required this.knowledgeCheck,
      required this.result});

  @override
  List<Page> get routes => [
        KnowledgeCheckResultRoute(
          world: world,
          knowledgeCheck: knowledgeCheck,
          result: result,
        ).page,
      ];

  @override
  RouterState get popsInto {
    return LevelSelectRouteState(world: world);
  }

  @override
  List<Object?> get props => [world, knowledgeCheck, result];
}
