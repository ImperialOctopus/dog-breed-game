import 'package:dog_breed_game/model/learn_structure.dart';

import '../../model/progress/progress.dart';

/// Repository for user progress through levels.
abstract class ProgressRepository {
  /// Returns level progress for an id.
  Future<Progress> get loadProgress;

  /// Migrate current progress data using structure.
  Future<Progress> migrateProgress(Progress progress, LearnStructure structure);

  /// Stores a level progress object.
  Future<void> saveProgress(Progress progress);
}
