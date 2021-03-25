import 'package:flutter/material.dart';

import 'bloc/router_state.dart';
import 'learn/learn_route.dart';
import 'learn/level_route.dart';
import 'learn/world_route.dart';
import 'menu/menu_route.dart';

/// Build the app's routes from the state of the router bloc.
List<Page> buildRoutes(RouterState routerState) {
  return [
    const MenuRoute().page,
    if (routerState is RouterStateLearn) const LearnRoute().page,
    if (routerState is RouterStateLearnWorld)
      WorldRoute(world: routerState.world).page,
    if (routerState is RouterStateLearnLevel)
      if (routerState is RouterStateLearnResult)
        LevelRoute(
          level: routerState.level,
          showResults: true,
          score: routerState.score,
        ).page
      else
        LevelRoute(level: routerState.level).page,
  ];
}
