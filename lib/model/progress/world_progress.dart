import 'progress_item.dart';

/// Progress for a world.
class WorldProgress {
  final Map<String, ProgressItem> _levels;

  /// Progress for a world.
  const WorldProgress({required Map<String, ProgressItem> levels})
      : _levels = levels;
}
