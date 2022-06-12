import 'package:flutter/material.dart';

import '../../../screens/practice/practice_settings_screen.dart';
import '../../provides_page.dart';
import '../../router_state.dart';
import '../menu_route.dart';

/// Practice main route.
class PracticeRoute extends StatelessWidget with ProvidesPage<void> {
  /// Practice main route.
  const PracticeRoute();

  @override
  Widget build(BuildContext context) {
    return const PracticeSettingsScreen();
  }
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
