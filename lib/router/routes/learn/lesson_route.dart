import 'package:flutter/material.dart';

import '../../../model/learn/lesson.dart';
import '../../../model/learn/world.dart';
import '../../../screens/learn/lesson/lesson_screen.dart';
import '../../provides_page.dart';
import '../../router_state.dart';
import 'level_select_route.dart';

/// Route for a lesson.
class LessonRoute extends StatelessWidget with ProvidesPage<void> {
  /// World the lesson is in.
  final World world;

  /// Level to display.
  final Lesson lesson;

  /// Route for a level.
  const LessonRoute({required this.world, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return LessonScreen(lesson: lesson);
  }
}

/// /learn/{world}/{lesson}
class LessonRouteState extends RouterState {
  /// World the lesson is in.
  final World world;

  /// Level to display.
  final Lesson lesson;

  /// /learn/{world}/{level}
  const LessonRouteState({required this.world, required this.lesson});

  @override
  List<Page> get routes => [
        LessonRoute(world: world, lesson: lesson).page,
      ];

  @override
  RouterState get popsInto {
    return LevelSelectRouteState(world: world);
  }

  @override
  List<Object?> get props => [world, lesson];
}
