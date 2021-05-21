import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/progress/progress_cubit.dart';
import '../model/level/level.dart';
import '../model/progress/level_progress.dart';
import '../model/progress/progress.dart';

/// Builder for progress cubit.
class LevelProgressCubitBuilder extends StatelessWidget {
  /// Lavel for level.
  final Level level;

  /// Builder for child widget.
  final Widget Function(BuildContext context, LevelProgress progress) builder;

  /// Builder for progress cubit.
  const LevelProgressCubitBuilder({required this.level, required this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgressCubit, Progress>(
      builder: (context, state) {
        final _progress = state.getLevel(level);

        return builder(context, _progress);
      },
    );
  }
}
