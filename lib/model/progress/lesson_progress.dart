import 'level_progress.dart';

/// Progress through a level.
class LessonProgress extends LevelProgress {
  @override
  final String id;

  @override
  final bool complete;

  /// Progress through a level.
  LessonProgress({
    required this.id,
    this.complete = false,
  });
}
