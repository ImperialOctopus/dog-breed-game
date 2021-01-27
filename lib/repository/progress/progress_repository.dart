import '../../model/progress/level_progress.dart';

/// Repository for user progress through levels.
abstract class ProgressRepository {
  /// Returns level progress for an id.
  Future<LevelProgress> getProgress(int id);

  /// Stores a level progress object.
  Future<void> updateProgress(LevelProgress progress);
}
