import '../router_action.dart';
import '../router_state.dart';
import '../routes/learn_route.dart';
import '../routes/practice_route.dart';

/// Options for the open menu route action.
enum MainMenuOption {
  /// Learn main menu route.
  learn,

  /// Practice main menu route.
  practice,
}

/// Open a page from the main menu.
class RouterOpenMenuOption extends RouterAction {
  /// Which page to open.
  final MainMenuOption mainMenuOption;

  /// Open a page from the main menu.
  const RouterOpenMenuOption({required this.mainMenuOption});

  @override
  Stream<RouterState> mapToState(RouterState currentState) async* {
    if (mainMenuOption == MainMenuOption.learn) {
      yield const LearnRouteState();
      return;
    }
    if (mainMenuOption == MainMenuOption.practice) {
      yield const PracticeRouteState();
      return;
    }
    throw FallThroughError();
  }

  @override
  List<Object?> get props => [mainMenuOption];
}
