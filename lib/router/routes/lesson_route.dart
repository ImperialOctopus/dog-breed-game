import 'package:flutter/material.dart';

import '../../model/level/knowledge_check.dart';
import '../../model/level/lesson.dart';
import '../../model/level/level.dart';
import '../../screens/learn/knowledge_check/knowledge_check_screen.dart';
import '../../screens/learn/lesson/lesson_screen.dart';
import '../provides_page.dart';

/// Route for a level.
class LevelRoute extends StatelessWidget implements ProvidesPage<void> {
  /// Level to display.
  final Level level;

  /// Route for a level.
  const LevelRoute({required this.level});

  @override
  Widget build(BuildContext context) {
    // Local variable to allow compiler to promote type.
    final _level = level;

    // Return screen for the type of lesson this is.
    if (_level is KnowledgeCheck) {
      return KnowledgeCheckScreen(knowledgeCheck: _level);
    }
    if (_level is Lesson) {
      return LessonScreen(lesson: _level);
    }

    // Falls through if level is an unsupported type.
    throw FallThroughError();
  }

  @override
  Page<void> get page => MaterialPage(child: this);
}
