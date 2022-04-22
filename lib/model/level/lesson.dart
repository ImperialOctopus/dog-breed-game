import 'package:flutter/material.dart';

import 'level.dart';

/// Informational lesson from a level.
class Lesson implements Level {
  /// Widget to render as this lesson's main body.
  final List<List<Widget>> content;

  @override
  final String title;

  @override
  final String? subtitle;

  @override
  final String imagePath;

  @override
  final String label;

  /// Informational lesson from a level.
  const Lesson({
    required this.label,
    required this.title,
    this.subtitle,
    required this.imagePath,
    required this.content,
  });
}
