import '../../model/quiz/quiz_result.dart';
import '../../model/quiz/quiz_settings.dart';
import '../router_action.dart';
import '../router_state.dart';
import '../routes/practice/practice_result_route.dart';

/// Practice quiz page.
class RouterEndPractice extends RouterAction {
  /// Settings for the quiz.
  final QuizSettings settings;

  /// Result from the quiz.
  final QuizResult result;

  /// Practice quiz page.
  const RouterEndPractice({required this.settings, required this.result});

  @override
  Stream<RouterState> mapToState(RouterState currentState) async* {
    yield PracticeResultRouteState(settings: settings, result: result);
  }

  @override
  List<Object?> get props => [settings, result];
}
