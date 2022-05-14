import '../../model/world.dart';
import '../router_action.dart';
import '../router_state.dart';
import '../routes/world_route.dart';

/// Open world in learn route.
class RouterOpenWorld extends RouterAction {
  /// World to open.
  final World world;

  /// Open world in learn route.
  const RouterOpenWorld({required this.world});

  @override
  Stream<RouterState> mapToState(RouterState currentState) async* {
    yield WorldRouteState(world: world);
  }

  @override
  List<Object?> get props => [world];
}
