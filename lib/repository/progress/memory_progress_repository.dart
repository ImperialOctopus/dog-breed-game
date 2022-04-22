import '../../exception/progress_key_not_found_exception.dart';
import '../../model/learn_structure.dart';
import '../../model/progress/level_not_complete.dart';
import '../../model/progress/level_progress.dart';
import '../../model/progress/level_scored.dart';
import '../../model/progress/progress.dart';
import 'progress_repository.dart';

/// Progress repository stored only in memory.
class MemoryProgressRepository implements ProgressRepository {
  Progress _progress = const Progress(levels: {
    '01_01_common_breeds': LevelScored(2, 7),
    '01_02_uncommon_breeds': LevelScored(5, 7),
    '01_03_some_gaps': LevelNotComplete(),
  });

  /// Progress repository stored only in memory.
  MemoryProgressRepository();

  @override
  Future<Progress> get loadProgress async {
    await Future<void>.delayed(const Duration(milliseconds: 600));
    return _progress;
  }

  @override
  Future<Progress> migrateProgress(
      Progress progress, LearnStructure structure) async {
    final levelMap = <String, LevelProgress>{};

    for (final world in structure.worlds) {
      for (final level in world.levels) {
        LevelProgress _levelProgress;
        try {
          _levelProgress = progress.getLevel(level);
        } on ProgressKeyNotFoundException {
          _levelProgress = const LevelNotComplete();
        }
        levelMap[level.label] = _levelProgress;
      }
    }

    await Future<void>.delayed(const Duration(milliseconds: 200));
    return Progress(levels: levelMap);
  }

  @override
  Future<void> saveProgress(Progress progress) async {
    _progress = progress;
  }
}
