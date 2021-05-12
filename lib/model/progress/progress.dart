import 'level_progress.dart';

/// Progress through app.
class Progress {
  /// Map of levels.
  final Map<String, LevelProgress> levels;

  /// Progress through app.
  const Progress({required this.levels});
}
