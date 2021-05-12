import '../../model/learn_structure.dart';
import '../../model/progress/progress.dart';
import '../../model/progress/progress_item_score.dart';
import '../../model/progress/world_progress.dart';
import 'progress_repository.dart';

/// Progress repository stored only in memory.
class MemoryProgressRepository implements ProgressRepository {
  Progress _progress = const Progress(worlds: {
    '01_most_common': WorldProgress(levels: {
      '01_common_breeds': ProgressItemScore(2, 7),
      '02_uncommon_breeds': ProgressItemScore(5, 7),
      '03_some_gaps': ProgressItemScore(2, 10),
    }),
  });

  /// Progress repository stored only in memory.
  MemoryProgressRepository();

  @override
  Future<Progress> get loadProgress async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return _progress;
  }

  @override
  Future<Progress> migrateProgress(
      Progress progress, LearnStructure structure) async {
    //TODO: implement migration.
    await Future<void>.delayed(const Duration(seconds: 1));
    return progress;
  }

  @override
  Future<void> saveProgress(Progress progress) async {
    _progress = progress;
  }
}
