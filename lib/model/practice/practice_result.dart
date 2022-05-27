import 'package:equatable/equatable.dart';

import 'practice_end_state.dart';

/// Result from a practice quiz.
class PracticeResult extends Equatable {
  /// Mistakes made in the quiz.
  final int mistakes;

  /// Questions answered correctly.
  final int score;

  /// Reason for the end of the practice.
  final PracticeEndState practiceEndState;

  /// Result from a practice quiz.
  const PracticeResult(
      {required this.mistakes,
      required this.score,
      required this.practiceEndState});

  @override
  List<Object?> get props => [mistakes, score, practiceEndState];
}
