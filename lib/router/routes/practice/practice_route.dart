import 'package:flutter/material.dart';

import '../../../screens/practice/practice_settings_screen.dart';
import '../../provides_page.dart';
import '../../router_state.dart';
import '../../transitions/default_transition.dart';
import '../menu_route.dart';

/// Practice main route.
class PracticeRoute extends StatelessWidget implements ProvidesPage<void> {
  /// Practice main route.
  const PracticeRoute();

  LocalKey get _key => const ValueKey<Type>(PracticeRoute);

  @override
  Widget build(BuildContext context) {
    return const PracticeSettingsScreen();
  }

  @override
  Page<void> get page => DefaultTransition(child: this, key: _key);
}

/// /practice
class PracticeRouteState extends RouterState {
  /// /practice
  const PracticeRouteState();

  @override
  List<Page> get routes => [
        const PracticeRoute().page,
      ];

  @override
  RouterState get popsInto => const MenuRouteState();

  @override
  List<Object?> get props => [];
}
