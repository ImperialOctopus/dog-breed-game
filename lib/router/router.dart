import 'package:flutter/material.dart';

import 'bloc/router_state.dart';
import 'practice/practice_route.dart';
import 'practice/practice_settings_route.dart';
import 'routes/learn_route.dart';
import 'routes/lesson_route.dart';
import 'routes/menu_route.dart';
import 'routes/world_route.dart';

/// Build the app's routes from the state of the router bloc.
List<Page> buildRoutes(RouterState routerState) {
  return [
    const MenuRoute().page,
    if (routerState is RouterStatePractice) ...[
      const PracticeSettingsRoute().page,
      if (routerState is RouterStatePracticeQuiz) ...[
        PracticeRoute(settings: routerState.settings).page,
      ],
    ],
    if (routerState is RouterStateLearn) ...[
      const LearnRoute().page,
      if (routerState is RouterStateLearnWorld) ...[
        WorldRoute(world: routerState.world).page,
        if (routerState is RouterStateLearnLevel)
          LevelRoute(level: routerState.level).page,
      ],
    ],
  ];
}
