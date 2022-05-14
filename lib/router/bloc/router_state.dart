import 'package:equatable/equatable.dart';

import '../../model/level/knowledge_check.dart';
import '../../model/level/level.dart';
import '../../model/practice/practice_settings.dart';
import '../../model/world.dart';

/// State for router bloc.
abstract class RouterState extends Equatable {
  /// State for router bloc.
  const RouterState();

  /// What to replace state with on pop.
  RouterState get popsInto;
}

/// /
class RouterStateHome extends RouterState {
  /// Home route.
  const RouterStateHome();

  @override
  RouterState get popsInto => this;

  @override
  List<Object?> get props => [];
}

/// /practice
class RouterStatePractice extends RouterState {
  /// /practice
  const RouterStatePractice();

  @override
  RouterState get popsInto => const RouterStateHome();

  @override
  List<Object?> get props => [];
}

/// /practice/quiz
class RouterStatePracticeQuiz extends RouterStatePractice {
  /// Settings for the quiz.
  final PracticeSettings settings;

  /// /practice/quiz
  const RouterStatePracticeQuiz({required this.settings});

  @override
  RouterState get popsInto => const RouterStatePractice();

  @override
  List<Object?> get props => [settings];
}

/// /learn
class RouterStateLearn extends RouterState {
  /// /learn
  const RouterStateLearn();

  @override
  RouterState get popsInto => const RouterStateHome();

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
  RouterState get popsInto => const RouterStateLearn();

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
  RouterState get popsInto => RouterStateLearnWorld(world: world);

  @override
  List<Object?> get props => [...super.props, level];
}

/// Show result of a knowledge check level.
class RouterStateKnowledgeCheckResult extends RouterStateLearnWorld {
  /// Score from the knowledge check.
  final KnowledgeCheck result;

  /// Level this is the result for.
  final KnowledgeCheck knowledgeCheck;

  /// Show result of a quiz level.
  const RouterStateKnowledgeCheckResult(
      {required World world,
      required this.knowledgeCheck,
      required this.result})
      : super(world: world);

  @override
  RouterState get popsInto => RouterStateLearnWorld(world: world);

  @override
  List<Object?> get props => [...super.props, knowledgeCheck, result];
}
