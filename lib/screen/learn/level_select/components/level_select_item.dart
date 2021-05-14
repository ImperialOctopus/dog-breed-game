import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/level_header.dart';
import '../../../../components/level_progress_cubit_builder.dart';
import '../../../../model/level/level.dart';
import '../../../../model/world.dart';
import '../../../../routes/bloc/router_bloc.dart';
import '../../../../routes/bloc/router_event.dart';
import 'level_progress_indicator.dart';

/// Header with information about a level.
class LevelSelectItem extends StatelessWidget {
  /// World the level belongs to.
  final World world;

  /// Level this selects.
  final Level level;

  /// Height.
  static const double height = 100;

  /// Header with information about a level.
  const LevelSelectItem({required this.world, required this.level});

  @override
  Widget build(BuildContext context) {
    return LevelHeader(
      leading: SizedBox(
        height: height,
        width: 150,
        child: Hero(
          tag: level,
          child: Image.asset(level.imagePath, fit: BoxFit.cover),
        ),
      ),
      trailing: LevelProgressCubitBuilder(
        worldLabel: world.label,
        levelLabel: level.label,
        builder: (context, progress) =>
            LevelProgressIndicator(progress: progress),
      ),
      title: level.title,
      subtitle: level.subtitle,
      height: height,
      onTap: () => BlocProvider.of<RouterBloc>(context)
          .add(RouterEventLevelSelected(level: level)),
    );
  }
}
