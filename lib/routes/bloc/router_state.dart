import 'package:equatable/equatable.dart';

import '../../model/level/lesson.dart';
import '../../model/level/level.dart';
import '../../model/level/quiz.dart';
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
abstract class RouterStateLearnLevel extends RouterStateLearnWorld {
  /// /learn/{world}/{level}
  const RouterStateLearnLevel({required World world}) : super(world: world);

  /// Level to display.
  Level get level;

  @override
  List<Object?> get props => [...super.props, level];
}

/// /learn/{world}/{level}
class RouterStateLearnLesson extends RouterStateLearnLevel {
  /// Level to display.
  @override
  final Lesson level;

  /// /learn/{world}/{level}
  const RouterStateLearnLesson({required World world, required this.level})
      : super(world: world);
}

/// /learn/{world}/{level}
class RouterStateLearnQuiz extends RouterStateLearnLevel {
  /// Level to display.
  @override
  final Quiz level;

  /// /learn/{world}/{level}
  const RouterStateLearnQuiz({required World world, required this.level})
      : super(world: world);
}

/// Show result of a quiz level.
class RouterStateLearnResult extends RouterStateLearnQuiz {
  /// Score from the quiz.
  final int score;

  /// Show result of a quiz level.
  const RouterStateLearnResult(
      {required World world, required Quiz quiz, required this.score})
      : super(world: world, level: quiz);

  @override
  List<Object?> get props => [...super.props, score];
}
