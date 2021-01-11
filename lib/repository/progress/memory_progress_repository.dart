import '../../model/level.dart';
import '../../model/progress/level_progress.dart';
import 'progress_repository.dart';

/// Progress repository stored only in memory.
class MemoryProgressRepository implements ProgressRepository {
  List<LevelProgress> _progress = const [];

  /// Progress repository stored only in memory.
  MemoryProgressRepository();

  @override
  Future<LevelProgress> readProgressById(int id) async {
    return _progress.singleWhere((element) => element.id == id,
        orElse: () => LevelProgress.zero(id: id));
  }

  @override
  Future<LevelProgress> readProgressByLevel(Level level) =>
      readProgressById(level.id);

  @override
  Future<void> updateProgress(LevelProgress progress) async {
    _progress = _progress.where((element) => element.id != progress.id).toList()
      ..add(progress);
  }
}
