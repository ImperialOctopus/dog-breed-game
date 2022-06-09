import 'package:flutter/material.dart';

import '../../data/story/worlds.dart';
import '../../screens/learn/level_select/world_select_screen.dart';
import '../router_state.dart';
import '../provides_page.dart';
import '../transitions/default_transition.dart';
import 'menu_route.dart';

/// Learn main route.
class LearnRoute extends StatelessWidget implements ProvidesPage<void> {
  /// Learn main route.
  const LearnRoute();

  LocalKey get _key => const ValueKey<Type>(LearnRoute);

  @override
  Widget build(BuildContext context) {
    // Learn structure is acquired here and used to build the world select.
    // Below this point data is acquired directly from parents.
    return WorldSelectScreen(
      worlds: worlds,
    );
  }

  @override
  Page<void> get page => DefaultTransition(child: this, key: _key);
}

/// /learn
class LearnRouteState extends RouterState {
  /// /learn
  const LearnRouteState();

  @override
  List<Page> get routes => [
        const LearnRoute().page,
      ];

  @override
  RouterState get popsInto => const MenuRouteState();

  @override
  List<Object?> get props => [];
}
