import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/level/lesson.dart';
import '../../model/level/quiz.dart';
import '../bloc/router_event.dart';
import '../bloc/router_state.dart';

/// Bloc for app router.
class RouterBloc extends Bloc<RouterEvent, RouterState> {
  /// Bloc for app router.
  RouterBloc() : super(const RouterStateHome());

  @override
  Stream<RouterState> mapEventToState(RouterEvent event) async* {
    if (event is RouterEventPop) {
      yield _mapPopToState();
      return;
    }
    if (event is RouterEventLearn) {
      yield const RouterStateLearn();
      return;
    }
    if (event is RouterEventWorldSelected) {
      yield RouterStateLearnWorld(world: event.world);
      return;
    }
    if (event is RouterEventLevelSelected) {
      final _state = state;
      if (_state is RouterStateLearnWorld) {
        final _level = event.level;
        if (_level is Quiz) {
          yield RouterStateLearnQuiz(
            world: _state.world,
            level: _level,
          );
        }
        if (_level is Lesson) {
          yield RouterStateLearnLesson(
            world: _state.world,
            level: _level,
          );
        }
      }
      return;
    }
    if (event is RouterEventQuizResults) {
      final _state = state;
      if (_state is RouterStateLearnQuiz) {
        yield RouterStateLearnResult(
            world: _state.world, quiz: _state.level, score: event.score);
      }
      return;
    }

    throw FallThroughError();
  }

  RouterState _mapPopToState() {
    final _state = state;

    if (_state is RouterStateLearnLevel) {
      return RouterStateLearnWorld(world: _state.world);
    }
    if (_state is RouterStateLearnWorld) {
      return const RouterStateLearn();
    }
    if (_state is RouterStateLearn) {
      return const RouterStateHome();
    }

    if (_state is RouterStateHome) {
      return _state;
    }

    throw FallThroughError();
  }
}
