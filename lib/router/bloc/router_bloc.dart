import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/router_event.dart';
import '../bloc/router_state.dart';

/// Bloc for app router.
class RouterBloc extends Bloc<RouterEvent, RouterState> {
  /// Bloc for app router.
  RouterBloc() : super(const RouterStateHome());

  @override
  Stream<RouterState> mapEventToState(RouterEvent event) async* {
    yield* event.mapToState(state);
  }
}
