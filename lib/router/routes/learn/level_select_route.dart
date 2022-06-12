import 'package:flutter/material.dart';

import '../../../model/learn/world.dart';
import '../../../screens/learn/level_select/level_select_screen.dart';
import '../../provides_page.dart';
import '../../router_state.dart';
import 'world_select_route.dart';

/// Level select inside a world.
class LevelSelectRoute extends StatelessWidget with ProvidesPage<void> {
  /// World to display.
  final World world;

  /// Level select inside a world.
  const LevelSelectRoute({required this.world});

  @override
  Widget build(BuildContext context) {
    return LevelSelectScreen(world: world);
  }
}

/// /learn/{world}
class LevelSelectRouteState extends RouterState {
  /// World to display.
  final World world;

  /// /learn/{world}
  const LevelSelectRouteState({required this.world});

  @override
  List<Page> get routes => [
        LevelSelectRoute(world: world).page,
      ];

  @override
  RouterState get popsInto => const WorldSelectRouteState();

  @override
  List<Object?> get props => [world];
}
