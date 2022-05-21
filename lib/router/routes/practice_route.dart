import 'package:flutter/material.dart';

import '../../screens/practice/practice_screen.dart';
import '../provides_page.dart';
import '../router_state.dart';
import 'menu_route.dart';

/// Practice main route.
class PracticeRoute extends StatelessWidget implements ProvidesPage<void> {
  /// Practice main route.
  const PracticeRoute();

  final _key = const ValueKey<Type>(PracticeRoute);

  @override
  Widget build(BuildContext context) {
    return const PracticeScreen();
  }

  @override
  Page<void> get page => MaterialPage(child: this, key: _key);
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
