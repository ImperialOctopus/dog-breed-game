import 'package:flutter/material.dart';

import 'level.dart';

/// Informational lesson from a level.
class Lesson extends Level {
  /// Widget to render as this lesson's main body.
  final List<Widget> children;

  /// Informational lesson from a level.
  const Lesson({
    required String id,
    required String title,
    String? subtitle,
    required String imagePath,
    required this.children,
  }) : super(
          id: id,
          title: title,
          subtitle: subtitle,
          imagePath: imagePath,
        );
}
