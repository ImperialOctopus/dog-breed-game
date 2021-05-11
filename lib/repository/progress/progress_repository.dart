import '../../model/progress/progress.dart';

/// Repository for user progress through levels.
abstract class ProgressRepository {
  /// Returns level progress for an id.
  Future<Progress> get loadProgress;

  /// Stores a level progress object.
  Future<void> saveProgress(Progress progress);
}
