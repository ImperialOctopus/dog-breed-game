import 'package:equatable/equatable.dart';

import '../../model/level/level.dart';
import '../../model/level/quiz.dart';
import '../../model/quiz_result.dart';
import '../../model/world.dart';

/// State for router bloc.
abstract class RouterState extends Equatable {
  /// State for router bloc.
  const RouterState();
}

/// /
class RouterStateHome extends RouterState {
  /// Home route.
  const RouterStateHome();

  @override
  List<Object?> get props => [];
}

/// /learn
class RouterStateLearn extends RouterState {
  /// /learn
  const RouterStateLearn();

  @override
  List<Object?> get props => [];
}

/// /learn/{world}
class RouterStateLearnWorld extends RouterStateLearn {
  /// World to display.
  final World world;

  /// /learn/{world}
  const RouterStateLearnWorld({required this.world});

  @override
  List<Object?> get props => [world];
}

/// /learn/{world}/{level}
class RouterStateLearnLevel extends RouterStateLearnWorld {
  /// /learn/{world}/{level}
  const RouterStateLearnLevel({required World world, required this.level})
      : super(world: world);

  /// Level to display.
  final Level level;

  @override
  List<Object?> get props => [...super.props, level];
}

/// Show result of a quiz level.
class RouterStateQuizResult extends RouterStateLearnWorld {
  /// Score from the quiz.
  final QuizResult result;

  /// Quiz level this is the result for.
  final Quiz quiz;

  /// Show result of a quiz level.
  const RouterStateQuizResult(
      {required World world, required this.quiz, required this.result})
      : super(world: world);

  @override
  List<Object?> get props => [...super.props, quiz, result];
}
