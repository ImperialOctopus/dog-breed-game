import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/router_event.dart';
import '../bloc/router_state.dart';

/// Bloc for app router.
class RouterBloc extends Bloc<RouterEvent, RouterState> {
  /// Bloc for app router.
  RouterBloc() : super(const RouterStateHome());

  @override
  Stream<RouterState> mapEventToState(RouterEvent event) async* {
    if (event is RouterEventPop) {
      yield state.popsInto;
      return;
    }

    // Practice path
    if (event is RouterEventPractice) {
      yield const RouterStatePractice();
      return;
    }

    // Learn path
    if (event is RouterEventLearn) {
      yield const RouterStateLearn();
      return;
    }
    if (event is RouterEventWorldSelected) {
      yield RouterStateLearnWorld(world: event.world);
      return;
    }
    if (event is RouterEventLevelSelected) {
      final _state = state;
      if (_state is RouterStateLearnWorld) {
        final _level = event.level;
        yield RouterStateLearnLevel(
          world: _state.world,
          level: _level,
        );
        return;
      }
    }

    throw FallThroughError();
  }
}
