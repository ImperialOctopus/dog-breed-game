import 'package:equatable/equatable.dart';

import '../../model/level/level.dart';
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
  /// Level to display.
  final Level level;

  /// /learn/{world}/{level}
  const RouterStateLearnLevel({required World world, required this.level})
      : super(world: world);

  @override
  List<Object?> get props => [...super.props, level];
}

/// Show result of a quiz level.
class RouterStateLearnResult extends RouterStateLearnLevel {
  /// Score from the quiz.
  final int score;

  /// Show result of a quiz level.
  const RouterStateLearnResult(
      {required World world, required Level level, required this.score})
      : super(world: world, level: level);

  @override
  List<Object?> get props => [...super.props, score];
}
