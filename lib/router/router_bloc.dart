import 'package:flutter_bloc/flutter_bloc.dart';

import 'router_action.dart';
import 'router_state.dart';
import 'routes/menu_route.dart';

/// Bloc for app router.
class RouterBloc extends Bloc<RouterAction, RouterState> {
  /// Bloc for app router.
  RouterBloc() : super(const MenuRouteState());

  @override
  Stream<RouterState> mapEventToState(RouterAction event) =>
      event.mapToState(state);
}
