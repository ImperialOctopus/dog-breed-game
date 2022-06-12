import 'package:flutter/material.dart';

import 'level.dart';

/// Informational lesson from a level.
class Lesson extends Level {
  @override
  final String title;

  @override
  final String? subtitle;

  @override
  final String imagePath;

  /// Widget to render as this lesson's main body.
  final List<List<Widget>> content;

  /// Informational lesson from a level.
  const Lesson({
    required this.title,
    this.subtitle,
    required this.imagePath,
    required this.content,
  });

  @override
  List<Object?> get props => [title, subtitle, imagePath];
}
