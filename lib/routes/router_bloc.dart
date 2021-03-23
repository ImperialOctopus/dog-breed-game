import '../model/world.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'router_event.dart';
import 'router_state.dart';

/// Bloc for app router.
class RouterBloc extends Bloc<RouterEvent, RouterState> {
  /// Bloc for app router.
  RouterBloc() : super(const RouterStateHome());

  @override
  Stream<RouterState> mapEventToState(RouterEvent event) async* {
    if (event is RouterEventPop) {
      yield _mapPopToState();
      return;
    }
    if (event is RouterEventLearn) {
      yield const RouterStateLearn();
      return;
    }
    if (event is RouterEventWorldSelected) {
      yield RouterStateLearn(world: event.world);
      return;
    }
    if (event is RouterEventLevelSelected) {
      final _state = state;
      World? _world;
      if (_state is RouterStateLearn) {
        _world = _state.world;
      }
      yield RouterStateLearn(
        world: _world,
        level: event.level,
      );
      return;
    }

    throw FallThroughError();
  }

  RouterState _mapPopToState() {
    final _state = state;

    if (_state is RouterStateLearn) {
      if (_state.level != null) {
        return RouterStateLearn(world: _state.world);
      }

      if (_state.world != null) {
        return const RouterStateLearn();
      }

      return const RouterStateHome();
    }

    if (_state is RouterStateHome) {
      return _state;
    }

    throw FallThroughError();
  }
}
