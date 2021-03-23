import 'package:equatable/equatable.dart';

import '../model/level/level.dart';
import '../model/world.dart';

/// State for router bloc.
abstract class RouterState extends Equatable {
  /// State for router bloc.
  const RouterState();
}

/// Home route.
class RouterStateHome extends RouterState {
  /// Home route.
  const RouterStateHome();

  @override
  List<Object?> get props => [];
}

/// Learn route.
class RouterStateLearn extends RouterState {
  /// World to display.
  final World? world;

  /// Level to display.
  final Level? level;

  /// Learn route.
  const RouterStateLearn({this.world, this.level});

  @override
  List<Object?> get props => [world, level];
}
