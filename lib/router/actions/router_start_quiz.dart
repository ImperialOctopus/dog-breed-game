import '../../model/quiz/quiz_settings.dart';
import '../router_action.dart';
import '../router_state.dart';
import '../routes/practice/practice_quiz_route.dart';

/// Practice quiz page.
class RouterStartQuiz extends RouterAction {
  /// Settings for the quiz.
  final QuizSettings settings;

  /// Practice quiz page.
  const RouterStartQuiz({required this.settings});

  @override
  Stream<RouterState> mapToState(RouterState currentState) async* {
    yield PracticeQuizRouteState(settings: settings);
  }

  @override
  List<Object?> get props => [settings];
}
