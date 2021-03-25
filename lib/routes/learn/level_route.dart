import 'package:dog_breed_game/screen/learn/level/result_screen.dart';
import 'package:flutter/material.dart';

import '../../model/level/lesson.dart';
import '../../model/level/level.dart';
import '../../model/level/quiz.dart';
import '../../screen/learn/level/lesson_screen.dart';
import '../../screen/learn/level/quiz_screen.dart';
import '../provides_page.dart';

/// Route for a level.
class LevelRoute extends StatelessWidget implements ProvidesPage<void> {
  /// Level to display.
  final Level level;

  /// Should show results from a quiz.
  final bool showResults;

  /// Route for a level.
  const LevelRoute({required this.level, this.showResults = false});

  @override
  Widget build(BuildContext context) {
    final _level = level;

    if (_level is Quiz) {
      if (showResults) {
        return ResultScreen(quiz: _level);
      } else {
        return QuizScreen(quiz: _level);
      }
    }
    if (_level is Lesson) {
      return LessonScreen(lesson: _level);
    }

    throw FallThroughError();
  }

  @override
  Page<void> get page => MaterialPage(child: this);
}
