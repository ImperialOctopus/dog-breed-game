import 'package:flutter/material.dart';

import '../../screen/menu/menu_screen.dart';

/// Main menu route.
class MenuRoute extends StatelessWidget {
  /// Main menu route.
  const MenuRoute();

  @override
  Widget build(BuildContext context) {
    return const MenuScreen();
  }

  Page get page => MaterialPage<void>(child: this);
}

class _MenuRoutePage extends Page<void> {
  @override
  Route createRoute(BuildContext context) {
    // TODO: implement createRoute
    throw UnimplementedError();
  }
}
