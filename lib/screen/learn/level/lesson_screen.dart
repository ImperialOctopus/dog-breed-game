import 'package:flutter/material.dart';

import '../../../model/level/lesson.dart';
import '../../../model/world.dart';

/// Screen to show a single lesson.
class LessonScreen extends StatelessWidget {
  /// World this belongs to.
  final World world;

  /// Lesson to show on this screen.
  final Lesson lesson;

  /// Screen to show a single lesson.
  const LessonScreen({required this.world, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: lesson.children,
        ),
      ),
    );
  }
}
