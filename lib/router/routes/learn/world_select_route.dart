import 'package:flutter/material.dart';

import '../../../data/story/worlds.dart';
import '../../../screens/learn/level_select/world_select_screen.dart';
import '../../provides_page.dart';
import '../../router_state.dart';
import '../menu_route.dart';

/// Learn main route.
class WorldSelectRoute extends StatelessWidget with ProvidesPage<void> {
  /// Learn main route.
  const WorldSelectRoute();

  @override
  Widget build(BuildContext context) {
    // Learn structure is acquired here and used to build the world select.
    // Below this point data is acquired directly from parents.
    return WorldSelectScreen(
      worlds: worlds,
    );
  }
}

/// /learn
class WorldSelectRouteState extends RouterState {
  /// /learn
  const WorldSelectRouteState();

  @override
  List<Page> get routes => [
        const WorldSelectRoute().page,
      ];

  @override
  RouterState get popsInto => const MenuRouteState();

  @override
  List<Object?> get props => [];
}
