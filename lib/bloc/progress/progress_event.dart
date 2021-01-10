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

/// Progress was changed.
class UpdateProgress extends ProgressEvent {
  /// Progress model.
  final LevelProgress progress;

  /// User changed their progress.
  const UpdateProgress({required this.progress});

  @override
  List<Object?> get props => [progress];
}

/// Quiz was completed.
class QuizCompleted extends ProgressEvent {
  /// ID of level.
  final int levelId;

  /// Score achieved.
  final double score;

  /// Quiz was completed.
  const QuizCompleted({required this.levelId, required this.score});

  @override
  List<Object?> get props => [levelId, score];
}

/// Lesson was completed.
class LessonCompleted extends ProgressEvent {
  /// ID of level.
  final int levelId;

  /// Lesson was completed.
  const LessonCompleted({required this.levelId});

  @override
  List<Object?> get props => [levelId];
}
