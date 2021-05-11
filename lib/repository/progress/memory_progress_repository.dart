import '../../model/progress/progress.dart';
import 'progress_repository.dart';

/// Progress repository stored only in memory.
class MemoryProgressRepository implements ProgressRepository {
  Progress _progress = Progress();

  /// Progress repository stored only in memory.
  MemoryProgressRepository();

  @override
  Future<Progress> get loadProgress async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return _progress;
  }

  @override
  Future<void> saveProgress(Progress progress) async {
    _progress = progress;
  }
}
