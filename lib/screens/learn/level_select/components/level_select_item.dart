import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/level_header.dart';
import '../../../../components/level_progress_cubit_builder.dart';
import '../../../../model/level/level.dart';
import '../../../../router/actions/router_open_level.dart';
import '../../../../router/router_bloc.dart';
import 'level_progress_indicator.dart';

/// Header with information about a level.
class LevelSelectItem extends StatelessWidget {
  /// Level this selects.
  final Level level;

  /// Height.
  static const double height = 100;

  /// Header with information about a level.
  const LevelSelectItem({required this.level});

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
        level: level,
        builder: (context, progress) =>
            LevelProgressIndicator(progress: progress),
      ),
      title: level.title,
      subtitle: level.subtitle,
      height: height,
      onTap: () => BlocProvider.of<RouterBloc>(context)
          .add(RouterOpenLevel(level: level)),
    );
  }
}
