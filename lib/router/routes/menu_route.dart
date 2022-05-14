import 'package:flutter/material.dart';

import '../../screens/menu/menu_screen.dart';
import '../provides_page.dart';
import '../transitions/slide_up_transition.dart';

/// Main menu route.
class MenuRoute extends StatelessWidget with ProvidesPage<void> {
  /// Main menu route.
  const MenuRoute();

  @override
  Widget build(BuildContext context) {
    return const MenuScreen();
  }

  @override
  Page<void> get page => SlideUpTransition(child: this);
}
