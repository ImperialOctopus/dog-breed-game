import '../../model/learn_structure.dart';
import '../../model/progress/progress.dart';
import '../../model/progress/progress_item_none.dart';
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
    final _newProgress = progress.migrate((worldProgress) {
      for (final _world in structure.worlds) {
        var _worldProgress = worldProgress[_world.id];

        _worldProgress ??= const WorldProgress(levels: {});
        _worldProgress = _worldProgress.migrate((levelProgress) {
          for (final _level in _world.levels) {
            var _levelProgress = levelProgress[_level.id];

            _levelProgress ??= const ProgressItemNone();

            levelProgress[_level.id] = _levelProgress;
          }
          return levelProgress;
        });

        worldProgress[_world.id] = _worldProgress;
      }
      return worldProgress;
    });

    //await Future<void>.delayed(const Duration(seconds: 1));
    return _newProgress;
  }

  @override
  Future<void> saveProgress(Progress progress) async {
    _progress = progress;
  }
}
