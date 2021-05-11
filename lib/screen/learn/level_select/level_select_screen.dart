import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/level_header.dart';
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
          PhysicalModel(
            color: Colors.white,
            elevation: 2,
            child: Row(
              children: [
                SizedBox(
                  height: 70,
                  width: 150,
                  child: Hero(
                    tag: world,
                    child: Image.asset(world.imagePath, fit: BoxFit.cover),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(world.title),
                        const Text('59% complete'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            height: 0,
            thickness: 2,
          ),
          Expanded(
            child: ListView(
              children: world.levels
                  .map<Widget>(
                    (level) => Hero(
                      tag: level,
                      child: LevelHeader(
                        leading:
                            Image.asset(level.imagePath, fit: BoxFit.cover),
                        title: level.title,
                        subtitle: level.subtitle,
                        onTap: () => BlocProvider.of<RouterBloc>(context)
                            .add(RouterEventLevelSelected(level: level)),
                      ),
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
