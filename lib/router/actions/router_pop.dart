import '../router_action.dart';
import '../router_state.dart';

/// Pop the top route.
class RouterPop extends RouterAction {
  /// Pop the top route.
  const RouterPop();

  @override
  Stream<RouterState> mapToState(RouterState currentState) async* {
    yield currentState.popsInto;
  }

  @override
  List<Object?> get props => [];
}
