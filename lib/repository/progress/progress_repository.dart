import '../../model/level.dart';
import '../../model/progress/level_progress.dart';

/// Repository for user progress through levels.
abstract class ProgressRepository {
  /// Returns level progress for an id.
  Future<LevelProgress> readProgressById(int id);

  /// Returns level progress for a level.
  Future<LevelProgress> readProgressByLevel(Level level);

  /// Stores a level progress object.
  Future<void> updateProgress(LevelProgress progress);
}
