import 'package:equatable/equatable.dart';

import '../../model/progress/level_progress.dart';

/// Event for the progress bloc.
abstract class ProgressEvent extends Equatable {
  /// Event for the progress bloc.
  const ProgressEvent();
}

/// Load progress from the repository.
class LoadProgress extends ProgressEvent {
  /// Load progress from the repository.
  const LoadProgress();

  @override
  List<Object?> get props => [];
}

/// User changed their progress.
class UpdateProgress extends ProgressEvent {
  /// Progress model.
  final LevelProgress progress;

  /// User changed their progress.
  const UpdateProgress({required this.progress});

  @override
  List<Object?> get props => [progress];
}
