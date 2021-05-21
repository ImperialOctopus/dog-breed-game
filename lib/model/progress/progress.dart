import '../../exception/progress_key_not_found_exception.dart';
import '../level/level.dart';
import '../world.dart';
import 'level_progress.dart';
import 'world_progress.dart';

/// Function to replace worlds in progress model.
typedef MapLevels = Map<String, LevelProgress> Function(
    Map<String, LevelProgress> levels);

/// Progress through app.
class Progress {
  /// Map of levels.
  final Map<String, LevelProgress> _levels;

  /// Progress through app.
  const Progress({required Map<String, LevelProgress> levels})
      : _levels = levels;

  /// Get progress for a world.
  LevelProgress getLevel(Level level) {
    // Return the progress for the provided label.
    // Migration ensures values exist for all valid keys
    // So if value doesn't exist the key must be invalid.
    final _progress = _levels[level.label];
    if (_progress == null) {
      throw ProgressKeyNotFoundException(level.label);
    }
    return _progress;
  }

  /// Returns a copy of this with a world replaced.
  Progress setLevel(Level level, LevelProgress newProgress) {
    final _map = Map<String, LevelProgress>.from(_levels);

    _map[level.label] = newProgress;

    return Progress(levels: _map);
  }

  /// Returns world progress for a world.
  WorldProgress getWorld(World world) {
    return WorldProgress(
      levels: Map.fromEntries(
        world.levels.map(
          (level) => MapEntry(level.label, getLevel(level)),
        ),
      ),
    );
  }
}
