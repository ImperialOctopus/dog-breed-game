import '../../model/learn/knowledge_check.dart';
import '../../model/learn/lesson.dart';
import '../../model/learn/level.dart';
import '../../model/learn/world.dart';
import '../router_action.dart';
import '../router_state.dart';
import '../routes/learn/knowledge_check_intro_route.dart';
import '../routes/learn/lesson_route.dart';
import '../routes/learn/level_select_route.dart';

/// Open level in learn route.
class RouterOpenLevel extends RouterAction {
  /// World that contains this level.
  final World? world;

  /// Level to open.
  final Level level;

  /// Open level in learn route.
  const RouterOpenLevel({required this.level, this.world});

  @override
  Stream<RouterState> mapToState(RouterState currentState) async* {
    var _world = world;
    final _level = level;

    // Find current world if required.
    if (_world == null) {
      if (currentState is LevelSelectRouteState) {
        _world = currentState.world;
      }
    }

    if (_world == null) {
      throw StateError(
          'World cannot be null here. Provide a world or ensure the previous route is level select.');
    }

    // Navigate to correct subroute.
    if (_level is Lesson) {
      yield LessonRouteState(
        world: _world,
        lesson: _level,
      );
      return;
    }
    if (_level is KnowledgeCheck) {
      yield KnowledgeCheckIntroRouteState(
        world: _world,
        knowledgeCheck: _level,
      );
      return;
    }
    throw FallThroughError();
  }

  @override
  List<Object?> get props => [world, level];
}
