import 'package:equatable/equatable.dart';

import '../model/level/level.dart';
import '../model/world.dart';

abstract class RouterState extends Equatable {
  const RouterState();
}

class RouterStateHome extends RouterState {
  const RouterStateHome();

  @override
  List<Object?> get props => [];
}

class RouterStateLearn extends RouterState {
  final World? world;
  final Level? level;

  const RouterStateLearn({this.world, this.level});

  @override
  List<Object?> get props => [world, level];
}
