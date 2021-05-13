import 'package:dog_breed_game/components/world_progress_cubit_builder.dart';
import 'package:dog_breed_game/screen/learn/level_select/components/level_select_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/level_select_item.dart';
import '../../../extension/iterable_separate.dart';
import '../../../model/world.dart';
import '../../../routes/bloc/router_bloc.dart';
import '../../../routes/bloc/router_event.dart';

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
