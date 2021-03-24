import 'package:flutter/material.dart';

import 'level/level.dart';

/// Data structure for a world.
class World {
  /// Widget to display as title.
  final Widget title;

  /// Icon image.
  final String imagePath;

  /// List of levels.
  final List<Level> levels;

  /// Data structure for a world.
  const World({
    required this.title,
    required this.imagePath,
    required this.levels,
  });
}
