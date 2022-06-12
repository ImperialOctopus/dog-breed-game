import '../../model/quiz/quiz_settings.dart';
import '../router_action.dart';
import '../router_state.dart';
import '../routes/practice/practice_quiz_route.dart';

/// Practice quiz page.
class RouterStartPractice extends RouterAction {
  /// Settings for the quiz.
  final QuizSettings settings;

  /// Practice quiz page.
  const RouterStartPractice({required this.settings});

  @override
  Stream<RouterState> mapToState(RouterState currentState) async* {
    yield PracticeQuizRouteState(settings: settings);
  }

  @override
  List<Object?> get props => [settings];
}
