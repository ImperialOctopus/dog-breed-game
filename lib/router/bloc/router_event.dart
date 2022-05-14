import 'package:equatable/equatable.dart';

import '../../model/level/level.dart';
import '../../model/practice/practice_settings.dart';
import '../../model/world.dart';
import 'router_state.dart';

/// Event for router bloc.
abstract class RouterEvent extends Equatable {
  /// Event for router bloc.
  const RouterEvent();

  /// Maps this event to new state.
  Stream<RouterState> mapToState(RouterState currentState);
}

/// Pop the top route.
class RouterEventPop extends RouterEvent {
  /// Pop the top route.
  const RouterEventPop();

  @override
  Stream<RouterState> mapToState(RouterState currentState) async* {
    yield currentState.popsInto;
  }

  @override
  List<Object?> get props => [];
}

/// Open the practice page.
class RouterEventPractice extends RouterEvent {
  /// Open the practice page.
  const RouterEventPractice();

  @override
  Stream<RouterState> mapToState(RouterState currentState) async* {
    yield const RouterStatePractice();
  }

  @override
  List<Object?> get props => [];
}

/// Practice quiz page.
class RouterEventPracticeQuiz extends RouterEvent {
  /// Settings for the quiz.
  final PracticeSettings settings;

  /// Practice quiz page.
  const RouterEventPracticeQuiz({required this.settings});

  @override
  Stream<RouterState> mapToState(RouterState currentState) async* {
    yield RouterStatePracticeQuiz(settings: settings);
  }

  @override
  List<Object?> get props => [settings];
}

/// Open the learn page.
class RouterEventLearn extends RouterEvent {
  /// Open the learn page.
  const RouterEventLearn();

  @override
  Stream<RouterState> mapToState(RouterState currentState) async* {
    yield const RouterStateLearn();
  }

  @override
  List<Object?> get props => [];
}

/// Open world in learn route.
class RouterEventWorldSelected extends RouterEvent {
  /// World to open.
  final World world;

  /// Open world in learn route.
  const RouterEventWorldSelected({required this.world});

  @override
  Stream<RouterState> mapToState(RouterState currentState) async* {
    yield RouterStateLearnWorld(world: world);
  }

  @override
  List<Object?> get props => [world];
}

/// Open level in learn route.
class RouterEventLevelSelected extends RouterEvent {
  /// Level to open.
  final Level level;

  /// Open level in learn route.
  const RouterEventLevelSelected({required this.level});

  @override
  Stream<RouterState> mapToState(RouterState currentState) async* {
    if (currentState is RouterStateLearnWorld) {
      yield RouterStateLearnLevel(
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
