import 'package:equatable/equatable.dart';

import 'router_state.dart';

/// Event for router bloc.
abstract class RouterAction extends Equatable {
  /// Event for router bloc.
  const RouterAction();

  /// Maps this event to new state.
  Stream<RouterState> mapToState(RouterState currentState);
}
