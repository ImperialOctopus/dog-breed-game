import 'package:flutter/material.dart';

import '../../screen/menu/menu_screen.dart';
import '../provides_page.dart';

/// Main menu route.
class MenuRoute extends StatelessWidget with ProvidesPage<void> {
  /// Main menu route.
  const MenuRoute();

  @override
  Widget build(BuildContext context) {
    return const MenuScreen();
  }

  @override
  Page<void> get page => _MenuRoutePage(route: this);
}

class _MenuRoutePage extends Page<void> {
  final MenuRoute route;

  const _MenuRoutePage({required this.route});

  @override
  Route createRoute(BuildContext context) {
    return PageRouteBuilder<void>(
      settings: this,
      pageBuilder: (context, animation, animation2) {
        final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);
        final curveTween = CurveTween(curve: Curves.easeInOut);
        return SlideTransition(
          position: animation.drive(curveTween).drive(tween),
          child: route,
        );
      },
    );
  }
}
