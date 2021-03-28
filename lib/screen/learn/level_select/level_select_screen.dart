import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/level_header.dart';
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
      body: Column(
        children: [
          LevelHeader(
            imagePath: world.imagePath,
            title: world.title,
            subtitle: world.subtitle,
            onTap: () => BlocProvider.of<RouterBloc>(context)
                .add(const RouterEventPop()),
          ),
          Expanded(
            child: ListView(
              children: world.levels
                  .map((level) => ListTile(
                        title: Text(level.title),
                        subtitle: Text(level.subtitle ?? ''),
                        leading: Image.asset(level.imagePath),
                        onTap: () => BlocProvider.of<RouterBloc>(context)
                            .add(RouterEventLevelSelected(level: level)),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
