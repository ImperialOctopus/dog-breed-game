import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/level_header.dart';
import '../../../../model/level/level.dart';
import '../../../../routes/bloc/router_bloc.dart';
import '../../../../routes/bloc/router_event.dart';

/// Header with information about a level.
class LevelSelectItem extends StatelessWidget {
  /// Level this is selects.
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
      title: level.title,
      subtitle: level.subtitle,
      height: height,
      onTap: () => BlocProvider.of<RouterBloc>(context)
          .add(RouterEventLevelSelected(level: level)),
    );
  }
}
