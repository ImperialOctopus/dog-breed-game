import 'world_progress.dart';

/// Progress through app.
class Progress {
  /// Map of levels.
  final Map<String, WorldProgress> worlds;

  /// Progress through app.
  const Progress({required this.worlds});
}
