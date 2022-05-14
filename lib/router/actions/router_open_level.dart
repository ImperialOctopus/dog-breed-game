import '../../model/level/level.dart';
import '../router_action.dart';
import '../router_state.dart';
import '../routes/level_route.dart';
import '../routes/world_route.dart';

/// Open level in learn route.
class RouterOpenLevel extends RouterAction {
  /// Level to open.
  final Level level;

  /// Open level in learn route.
  const RouterOpenLevel({required this.level});

  @override
  Stream<RouterState> mapToState(RouterState currentState) async* {
    if (currentState is WorldRouteState) {
      yield LevelRouteState(
        world: currentState.world,
        level: level,
      );
    } else {
      throw StateError('Cannot navigate to level without a world.');
    }
  }

  @override
  List<Object?> get props => [level];
}
