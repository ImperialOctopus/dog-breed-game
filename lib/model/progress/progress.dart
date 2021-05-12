import 'world_progress.dart';

/// Function to replace worlds in progress model.
typedef MapWorlds = Map<String, WorldProgress> Function(
    Map<String, WorldProgress> worlds);

/// Progress through app.
class Progress {
  /// Map of levels.
  final Map<String, WorldProgress> worlds;

  /// Progress through app.
  const Progress({required this.worlds});

  /// Returns a new progress object with worlds mapped by a function.
  Progress migrate(MapWorlds mapWorlds) => Progress(worlds: mapWorlds(worlds));
}
