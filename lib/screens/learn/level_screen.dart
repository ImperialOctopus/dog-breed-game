import 'package:flutter/material.dart';

import '../../model/level/knowledge_check.dart';
import '../../model/level/lesson.dart';
import '../../model/level/level.dart';
import 'knowledge_check/knowledge_check_screen.dart';
import 'lesson/lesson_screen.dart';

/// Screen to display a level in learn mode.
class LevelScreen extends StatelessWidget {
  /// Level to display.
  final Level level;

  /// Screen to select a level in learn mode.
  const LevelScreen({required this.level});

  @override
  Widget build(BuildContext context) {
    final _level = level;

    // Return screen for the type of lesson this is.
    if (_level is KnowledgeCheck) {
      return KnowledgeCheckScreen(knowledgeCheck: _level);
    }
    if (_level is Lesson) {
      return LessonScreen(lesson: _level);
    }
    throw FallThroughError();
  }
}
