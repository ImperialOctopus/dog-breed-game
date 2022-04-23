import 'package:flutter/material.dart';

import '../../../extensions/iterable_separate.dart';
import '../../../model/world.dart';
import 'components/level_select_header.dart';
import 'components/level_select_item.dart';

/// Screen to select a level in learn mode.
class LevelSelectScreen extends StatelessWidget {
  /// Lessons to display on this screen.
  final World world;

  /// Screen to select a level in learn mode.
  const LevelSelectScreen({required this.world});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          LevelSelectHeader(world: world),
          Divider(
            color: Theme.of(context).primaryColor,
            height: 0,
            thickness: 2,
          ),
          Expanded(
            child: ListView(
              children: world.levels
                  .map<Widget>((level) => LevelSelectItem(level: level))
                  .separate(const Divider(height: 0))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
