import 'package:flutter/material.dart';

import '../../model/world.dart';
import '../../screen/learn/world/level_select_screen.dart';
import '../provides_page.dart';

/// Level select inside a world.
class WorldRoute extends StatelessWidget implements ProvidesPage<void> {
  /// World to display.
  final World world;

  /// Level select inside a world.
  const WorldRoute({required this.world});

  @override
  Widget build(BuildContext context) {
    return LevelSelectScreen(levels: world.levels);
  }

  @override
  Page<void> get page => MaterialPage(child: this);
}
