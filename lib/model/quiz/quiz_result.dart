import 'package:equatable/equatable.dart';

import 'quiz_end_state.dart';

/// Result from a practice quiz.
class QuizResult extends Equatable {
  /// Mistakes made in the quiz.
  final int mistakes;

  /// Questions answered correctly.
  final int score;

  /// Reason for the end of the practice.
  final QuizEndState endState;

  /// Result from a practice quiz.
  const QuizResult(
      {required this.mistakes, required this.score, required this.endState});

  @override
  List<Object?> get props => [mistakes, score, endState];
}
