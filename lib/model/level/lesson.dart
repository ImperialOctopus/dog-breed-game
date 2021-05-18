import 'package:flutter/material.dart';

import 'level.dart';

/// Informational lesson from a level.
class Lesson extends Level {
  /// Widget to render as this lesson's main body.
  final List<List<Widget>> content;

  /// Informational lesson from a level.
  const Lesson({
    required String label,
    required String title,
    String? subtitle,
    required String imagePath,
    required this.content,
  }) : super(
          label: label,
          title: title,
          subtitle: subtitle,
          imagePath: imagePath,
        );
}
