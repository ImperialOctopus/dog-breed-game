import 'package:flutter/material.dart';

import '../../data/worlds/world_01/world_01.dart';
import '../../screen/learn/world_select/world_select_screen.dart';
import '../provides_page.dart';

/// Learn main route.
class LearnRoute extends StatelessWidget implements ProvidesPage<void> {
  /// Learn main route.
  const LearnRoute();

  @override
  Widget build(BuildContext context) {
    return const WorldSelectScreen(
      worlds: [world01],
    );
  }

  @override
  Page<void> get page => MaterialPage(child: this);
}
