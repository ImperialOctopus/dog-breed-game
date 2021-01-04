import 'package:flutter/material.dart';

import '../../../model/level_lesson.dart';

/// Screen to show a single lesson.
class LessonScreen extends StatelessWidget {
  /// Lesson to show on this screen.
  final LevelLesson lesson;

  /// [lesson] is the lesson to show.
  const LessonScreen({required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: lesson.lessonBody,
        ),
      ),
    );
  }
}
