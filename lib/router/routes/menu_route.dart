import 'package:flutter/material.dart';

import '../../screens/menu/menu_screen.dart';
import '../router_state.dart';
import '../provides_page.dart';
import '../transitions/default_transition.dart';

/// Main menu route.
class MenuRoute extends StatelessWidget with ProvidesPage<void> {
  /// Main menu route.
  const MenuRoute();

  LocalKey get _key => const ValueKey<Type>(MenuRoute);

  @override
  Widget build(BuildContext context) {
    return const MenuScreen();
  }

  @override
  Page<void> get page => DefaultTransition(child: this, key: _key);
}

/// /
class MenuRouteState extends RouterState {
  /// /
  const MenuRouteState();

  @override
  List<Page> get routes => [
        const MenuRoute().page,
      ];

  @override
  RouterState get popsInto => this;

  @override
  List<Object?> get props => [];
}
