import 'package:dog_breed_game/model/level.dart';
import 'package:equatable/equatable.dart';

import '../../model/progress/level_progress.dart';

/// State for the progress bloc.
abstract class ProgressState extends Equatable {
  /// State for the progress bloc.
  const ProgressState();
}

/// Default progress bloc state.
class ProgressDefault extends ProgressState {
  /// Default progress bloc state.
  const ProgressDefault();

  @override
  List<Object?> get props => [];
}

/// Progress is loading.
class ProgressLoading extends ProgressState {
  /// Progress is loading.
  const ProgressLoading();

  @override
  List<Object?> get props => [];
}

/// Progress was loaded successfully.
class ProgressLoaded extends ProgressState {
  /// List of level progress models.
  final Iterable<LevelProgress> progress;

  /// Progress was loaded successfully.
  const ProgressLoaded({required this.progress});

  /// Returns level progress for the provided id.
  LevelProgress getProgressById(int id) =>
      progress.singleWhere((element) => element.levelId == id);

  /// Returns progress for a single level.
  LevelProgress getProgressByLevel(Level level) => getProgressById(level.id);

  @override
  List<Object?> get props => [progress];
}

/// Progress failed to load.
class ProgressLoadError extends ProgressState {
  /// Error message.
  final String message;

  /// Progress failed to load.
  const ProgressLoadError([this.message = '']);

  @override
  List<Object?> get props => [message];
}
