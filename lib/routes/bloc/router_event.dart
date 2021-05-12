import 'package:equatable/equatable.dart';

import '../../model/level/level.dart';
import '../../model/level/quiz.dart';
import '../../model/quiz_result.dart';
import '../../model/world.dart';

/// Event for router bloc.
abstract class RouterEvent extends Equatable {
  /// Event for router bloc.
  const RouterEvent();
}

/// Pop the top route.
class RouterEventPop extends RouterEvent {
  /// Pop the top route.
  const RouterEventPop();

  @override
  List<Object?> get props => [];
}

/// Open the learn page.
class RouterEventLearn extends RouterEvent {
  /// Open the learn page.
  const RouterEventLearn();

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
  List<Object?> get props => [world];
}

/// Open level in learn route.
class RouterEventLevelSelected extends RouterEvent {
  /// Level to open.
  final Level level;

  /// Open level in learn route.
  const RouterEventLevelSelected({required this.level});

  @override
  List<Object?> get props => [level];
}

/// Open quiz results.
class RouterEventQuizResults extends RouterEvent {
  /// Quiz this is the result for.
  final Quiz quiz;

  /// Score.
  final QuizResult result;

  /// Open quiz results.
  const RouterEventQuizResults({required this.quiz, required this.result});

  @override
  List<Object?> get props => [quiz, result];
}
