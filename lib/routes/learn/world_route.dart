import 'package:flutter/material.dart';

import '../../model/world.dart';
import '../../screen/learn/world/level_select_screen.dart';

/// Level select inside a world.
class WorldRoute extends StatelessWidget {
  /// World to display.
  final World world;

  /// Level select inside a world.
  const WorldRoute({required this.world});

  @override
  Widget build(BuildContext context) {
    return LevelSelectScreen(levels: world.levels);
  }
}
