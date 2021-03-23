import 'package:flutter_bloc/flutter_bloc.dart';

import 'router_event.dart';
import 'router_state.dart';

class RouterBloc extends Bloc<RouterEvent, RouterState> {
  RouterBloc() : super(const RouterStateHome());

  @override
  Stream<RouterState> mapEventToState(RouterEvent event) async* {
    if (event is RouterEventPop) {
      return;
    }
    if (event is RouterEventLearn) {
      return;
    }
    if (event is RouterEventWorldSelected) {
      return;
    }
    if (event is RouterEventLevelSelected) {
      return;
    }

    throw FallThroughError();
  }
}
