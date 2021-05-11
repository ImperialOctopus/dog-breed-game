/// Progress in a single level.
abstract class LevelProgress {
  /// ID of the level.
  String get id;

  /// Completed lesson.
  bool get complete;

  /// Progress in a single level.
  const LevelProgress();
}
