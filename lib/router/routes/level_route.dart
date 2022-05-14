import 'package:flutter/material.dart';

import '../../model/level/level.dart';
import '../../model/world.dart';
import '../../screens/learn/level_screen.dart';
import '../router_state.dart';
import '../provides_page.dart';
import 'world_route.dart';

/// Route for a level.
class LevelRoute extends StatelessWidget implements ProvidesPage<void> {
  /// Level to display.
  final Level level;

  /// Route for a level.
  const LevelRoute({required this.level});

  @override
  Widget build(BuildContext context) {
    return LevelScreen(level: level);
  }

  @override
  Page<void> get page => MaterialPage(child: this);
}

/// /learn/{world}/{level}
class LevelRouteState extends RouterState {
  /// World the level is in.
  final World world;

  /// Level to display.
  final Level level;

  /// /learn/{world}/{level}
  const LevelRouteState({required this.world, required this.level});

  @override
  List<Page> get routes => [
        LevelRoute(level: level).page,
      ];

  @override
  RouterState get popsInto => WorldRouteState(world: world);

  @override
  List<Object?> get props => [world, level];
}
