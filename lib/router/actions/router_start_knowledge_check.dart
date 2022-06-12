import '../../model/learn/knowledge_check.dart';
import '../../model/learn/world.dart';
import '../router_action.dart';
import '../router_state.dart';
import '../routes/learn/knowledge_check_intro_route.dart';
import '../routes/learn/knowledge_check_quiz_route.dart';

/// Practice quiz page.
class RouterStartKnowledgeCheck extends RouterAction {
  /// Knowledge check to begin.
  final KnowledgeCheck knowledgeCheck;

  /// Practice quiz page.
  const RouterStartKnowledgeCheck({required this.knowledgeCheck});

  @override
  Stream<RouterState> mapToState(RouterState currentState) async* {
    final _currentState = currentState;
    World? _world;

    if (_currentState is KnowledgeCheckIntroRouteState) {
      _world = _currentState.world;
    }

    if (_world == null) {
      throw StateError(
          'World cannot be null here. Provide a world or ensure the previous route is level select.');
    }

    yield KnowledgeCheckQuizRouteState(
        knowledgeCheck: knowledgeCheck, world: _world);
  }

  @override
  List<Object?> get props => [knowledgeCheck];
}
