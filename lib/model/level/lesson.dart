import 'package:flutter/material.dart';

import 'level.dart';

/// Informational lesson from a level.
class Lesson extends Level {
  /// Widget to render as this lesson's main body.
  final List<Widget> children;

  /// Informational lesson from a level.
  const Lesson({
    required int id,
    required Widget icon,
    required Widget title,
    Widget? subtitle,
    required this.children,
  }) : super(
          id: id,
          icon: icon,
          title: title,
          subtitle: subtitle,
        );
}
