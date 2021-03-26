import 'package:flutter/material.dart';

import '../../model/level/lesson.dart';
import '../../screen/learn/level/lesson_screen.dart';
import '../provides_page.dart';

/// Route for a level.
class LessonRoute extends StatelessWidget implements ProvidesPage<void> {
  /// Level to display.
  final Lesson lesson;

  /// Route for a level.
  const LessonRoute({required this.lesson});

  @override
  Widget build(BuildContext context) {
    return LessonScreen(lesson: lesson);
  }

  @override
  Page<void> get page => MaterialPage(child: this);
}
