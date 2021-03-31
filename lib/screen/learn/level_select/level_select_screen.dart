import 'package:dog_breed_game/components/fixed_height_cover_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/level_header.dart';
import '../../../model/world.dart';
import '../../../routes/bloc/router_bloc.dart';
import '../../../routes/bloc/router_event.dart';
import '../../../extension/iterable_separate.dart';

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
          PhysicalModel(
            color: Colors.white,
            elevation: 4,
            child: LevelHeader(
              leading: Hero(
                tag: world,
                child: Image.asset(world.imagePath, fit: BoxFit.cover),
              ),
              title: world.title,
              subtitle: world.subtitle,
            ),
          ),
          // Full-size world image.
          /*
          Hero(
            tag: world,
            child: FixedHeightCoverBox(
              child: Image.asset(world.imagePath),
              height: 300,
            ),
          ),
          */
          Expanded(
            child: ListView(
              children: world.levels
                  .map<Widget>(
                    (level) => LevelHeader(
                      leading: Image.asset(level.imagePath, fit: BoxFit.cover),
                      title: level.title,
                      subtitle: level.subtitle,
                      onTap: () => BlocProvider.of<RouterBloc>(context)
                          .add(RouterEventLevelSelected(level: level)),
                    ),
                  )
                  .separate(const Divider(
                    height: 0,
                  ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
