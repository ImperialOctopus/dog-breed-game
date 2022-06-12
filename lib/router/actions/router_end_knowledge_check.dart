import '../../model/learn/knowledge_check.dart';
import '../../model/learn/world.dart';
import '../../model/quiz/quiz_result.dart';
import '../router_action.dart';
import '../router_state.dart';
import '../routes/learn/knowledge_check_result_route.dart';

/// Practice quiz page.
class RouterEndQuiz extends RouterAction {
  /// World this is a child of.
  final World world;

  /// Knowledge check this ends.
  final KnowledgeCheck knowledgeCheck;

  /// Result from the quiz.
  final QuizResult result;

  /// Practice quiz page.
  const RouterEndQuiz(
      {required this.world,
      required this.knowledgeCheck,
      required this.result});

  @override
  Stream<RouterState> mapToState(RouterState currentState) async* {
    yield KnowledgeCheckResultRouteState(
      world: world,
      knowledgeCheck: knowledgeCheck,
      result: result,
    );
  }

  @override
  List<Object?> get props => [world, knowledgeCheck, result];
}
