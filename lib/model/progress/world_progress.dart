import '../../exception/progress_key_not_found_exception.dart';
import 'progress_item.dart';

/// Function to replace worlds in progress model.
typedef MapLevels = Map<String, ProgressItem> Function(
    Map<String, ProgressItem> levels);

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
      throw ProgressKeyNotFoundException('Invalid progress key: ' + label);
    }
    return _progress;
  }

  /// Returns a copy of this with a level replaced.
  WorldProgress replaceLevel(
      String label, ProgressItem Function(ProgressItem levelProgress) f) {
    final _map = Map<String, ProgressItem>.from(_levels);
    final _old = getLevel(label);

    _map['label'] = f(_old);

    return WorldProgress(levels: _map);
  }

  /// Percentage score for this world.
  double get result => 0.4;
}
