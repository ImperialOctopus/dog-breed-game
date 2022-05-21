import 'package:flutter/material.dart';

import '../../model/world.dart';
import '../../screens/learn/level_select/level_select_screen.dart';
import '../router_state.dart';
import '../provides_page.dart';
import 'learn_route.dart';

/// Level select inside a world.
class WorldRoute extends StatelessWidget implements ProvidesPage<void> {
  /// World to display.
  final World world;

  /// Level select inside a world.
  const WorldRoute({required this.world});

  final _key = const ValueKey<Type>(WorldRoute);

  @override
  Widget build(BuildContext context) {
    return LevelSelectScreen(world: world);
  }

  @override
  Page<void> get page => MaterialPage(child: this, key: _key);
}

/// /learn/{world}
class WorldRouteState extends RouterState {
  /// World to display.
  final World world;

  /// /learn/{world}
  const WorldRouteState({required this.world});

  @override
  List<Page> get routes => [
        WorldRoute(world: world).page,
      ];

  @override
  RouterState get popsInto => const LearnRouteState();

  @override
  List<Object?> get props => [world];
}
