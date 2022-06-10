import 'package:flutter/material.dart';

import '../../../model/learn/lesson.dart';
import '../../../model/learn/level.dart';
import '../../../model/learn/world.dart';
import '../../../screens/learn/lesson/lesson_screen.dart';
import '../../../screens/learn/level_screen.dart';
import '../../router_state.dart';
import '../../provides_page.dart';
import '../../transitions/default_transition.dart';
import 'level_select_route.dart';

/// Route for a lesson.
class LessonRoute extends StatelessWidget implements ProvidesPage<void> {
  /// Level to display.
  final Lesson lesson;

  /// Route for a level.
  const LessonRoute({required this.lesson});

  @override
  Widget build(BuildContext context) {
    return LessonScreen(lesson: lesson);
  }

  LocalKey get _key => ValueKey<Lesson>(lesson);

  @override
  Page<void> get page => DefaultTransition(child: this, key: _key);
}

/// /learn/{world}/{lesson}
class LessonRouteState extends RouterState {
  /// World the lesson is in.
  final World world;

  /// Level to display.
  final Lesson lesson;

  /// /learn/{world}/{level}
  const LessonRouteState({required this.world, required this.level});

  @override
  List<Page> get routes => [
        LevelRoute(level: level).page,
      ];

  @override
  RouterState get popsInto => WorldRouteState(world: world);

  @override
  List<Object?> get props => [world, level];
}
