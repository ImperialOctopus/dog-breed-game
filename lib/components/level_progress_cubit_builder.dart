import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/progress/progress_cubit.dart';
import '../model/progress/progress.dart';
import '../model/progress/progress_item.dart';

/// Builder for progress cubit.
class LevelProgressCubitBuilder extends StatelessWidget {
  /// Label for world.
  final String worldLabel;

  /// Lavel for level.
  final String levelLabel;

  /// Builder for child widget.
  final Widget Function(BuildContext context, ProgressItem progress) builder;

  /// Builder for progress cubit.
  const LevelProgressCubitBuilder(
      {required this.worldLabel,
      required this.levelLabel,
      required this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgressCubit, Progress>(
      builder: (context, state) {
        final _progress = state.getWorld(worldLabel).getLevel(levelLabel);
        return builder(context, _progress);
      },
    );
  }
}
