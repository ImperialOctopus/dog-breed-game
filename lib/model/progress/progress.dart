import '../../exception/progress_key_not_found_exception.dart';
import 'world_progress.dart';

/// Function to replace worlds in progress model.
typedef MapWorlds = Map<String, WorldProgress> Function(
    Map<String, WorldProgress> worlds);

/// Progress through app.
class Progress {
  /// Map of levels.
  final Map<String, WorldProgress> _worlds;

  /// Progress through app.
  const Progress({required Map<String, WorldProgress> worlds})
      : _worlds = worlds;

  /// Get progress for a world.
  WorldProgress getWorld(String label) {
    // Return the progress for the provided label.
    // Migration ensures values exist for all valid keys
    // So if value doesn't exist the key must be invalid.
    final _progress = _worlds[label];
    if (_progress == null) {
      throw ProgressKeyNotFoundException(label);
    }
    return _progress;
  }

  /// Returns a copy of this with a world replaced.
  Progress replaceWorld(
      String label, WorldProgress Function(WorldProgress worldProgress) f) {
    final _map = Map<String, WorldProgress>.from(_worlds);
    final _old = getWorld(label);

    _map[label] = f(_old);

    return Progress(worlds: _map);
  }
}
