import '../../exceptions/progress_key_not_found_exception.dart';
import '../level/level.dart';
import 'level_progress.dart';

/// Progress for a world.
class WorldProgress {
  final Map<String, LevelProgress> _levels;

  /// Progress for a world.
  const WorldProgress({required Map<String, LevelProgress> levels})
      : _levels = levels;

  /// Get progress for a level.
  LevelProgress getLevel(Level level) {
    // Return the progress for the provided label.
    // Migration ensures values exist for all valid keys
    // So if value doesn't exist the key must be invalid.
    final _progress = _levels[level.label];
    if (_progress == null) {
      throw ProgressKeyNotFoundException(
          'Invalid progress key: ' + level.label);
    }
    return _progress;
  }

  /// Percentage score for this world.
  double get result => _levels.isEmpty ? 0 : complete / levelCount;

  /// Number of levels that are complete.
  int get complete => _levels.values.where((level) => level.complete).length;

  /// Total number of levels.
  int get levelCount => _levels.length;
}
