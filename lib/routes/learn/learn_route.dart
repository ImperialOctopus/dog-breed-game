import 'package:flutter/material.dart';

import '../../screen/learn/world_select_screen.dart';
import '../provides_page.dart';

/// Learn main route.
class LearnRoute extends StatelessWidget implements ProvidesPage<void> {
  /// Learn main route.
  const LearnRoute();

  @override
  Widget build(BuildContext context) {
    return WorldSelectScreen();
  }

  @override
  Page<void> get page => MaterialPage(child: this);
}
