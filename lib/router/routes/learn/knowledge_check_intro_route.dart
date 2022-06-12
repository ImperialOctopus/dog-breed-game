import 'package:flutter/material.dart';

import '../../../model/learn/knowledge_check.dart';
import '../../../model/learn/world.dart';
import '../../../screens/learn/knowledge_check/knowledge_check_intro.dart';
import '../../provides_page.dart';
import '../../router_state.dart';
import 'level_select_route.dart';

/// Knowledge check intro.
class KnowledgeCheckIntroRoute extends StatelessWidget with ProvidesPage<void> {
  /// World this is a child of.
  final World world;

  /// Settings for the quiz.
  final KnowledgeCheck knowledgeCheck;

  /// Practice main route.
  const KnowledgeCheckIntroRoute(
      {required this.world, required this.knowledgeCheck});

  @override
  Widget build(BuildContext context) {
    return KnowledgeCheckIntroScreen(knowledgeCheck: knowledgeCheck);
  }
}

/// /learn/{world}/{knowledgeCheck}
class KnowledgeCheckIntroRouteState extends RouterState {
  /// World this is a child of.
  final World world;

  /// Settings for the quiz.
  final KnowledgeCheck knowledgeCheck;

  /// /learn/{world}/{knowledgeCheck}
  const KnowledgeCheckIntroRouteState(
      {required this.world, required this.knowledgeCheck});

  @override
  List<Page> get routes => [
        KnowledgeCheckIntroRoute(world: world, knowledgeCheck: knowledgeCheck)
            .page,
      ];

  @override
  RouterState get popsInto {
    return LevelSelectRouteState(world: world);
  }

  @override
  List<Object?> get props => [world, knowledgeCheck];
}
