import 'package:equatable/equatable.dart';

import '../model/level/level.dart';
import '../model/world.dart';

abstract class RouterEvent extends Equatable {
  const RouterEvent();
}

class RouterEventPop extends RouterEvent {
  const RouterEventPop();

  @override
  List<Object?> get props => [];
}

class RouterEventLearn extends RouterEvent {
  const RouterEventLearn();

  @override
  List<Object?> get props => [];
}

class RouterEventWorldSelected extends RouterEvent {
  final World world;

  const RouterEventWorldSelected({required this.world});

  @override
  List<Object?> get props => [world];
}

class RouterEventLevelSelected extends RouterEvent {
  final Level level;

  const RouterEventLevelSelected({required this.level});

  @override
  List<Object?> get props => [level];
}
