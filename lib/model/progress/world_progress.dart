import 'progress_item.dart';

/// Progress for a world.
class WorldProgress {
  final Map<String, ProgressItem> _levels;

  /// Progress for a world.
  const WorldProgress({required Map<String, ProgressItem> levels})
      : _levels = levels;

  /// Get progress for a level.
  ProgressItem getLevel(String label) {
    // Return the progress for the provided label.
    // Migration ensures values exist for all valid keys
    // So if value doesn't exist the key must be invalid.
    final _progress = _levels[label];
    if (_progress == null) {
      throw ArgumentError('Invalid progress key: ' + label);
    }
    return _progress;
  }
}
