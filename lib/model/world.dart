import 'level/level.dart';

/// Data structure for a world.
class World {
  /// Widget to display as title.
  final String title;

  /// Text of subtitle.
  final String? subtitle;

  /// Icon image.
  final String imagePath;

  /// List of levels.
  final List<Level> levels;

  /// Data structure for a world.
  const World({
    required this.title,
    this.subtitle,
    required this.imagePath,
    required this.levels,
  });
}
