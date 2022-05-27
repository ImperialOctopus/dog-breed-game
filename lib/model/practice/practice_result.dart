import 'package:equatable/equatable.dart';

/// Reason for practice ending.
enum PracticeEndReason {
  /// Ran out of lives.
  lives,

  /// Ran out of time in a timed quiz.
  time,

  /// Ran out of questions.
  questions,

  /// User ended quiz early.
  concede,
}

/// Result from a practice quiz.
class PracticeResult extends Equatable {
  /// Mistakes made in the quiz.
  final int mistakes;

  /// Questions answered correctly.
  final int score;

  /// Reason for the end of the practice.
  final PracticeEndReason practiceEndReason;

  /// Result from a practice quiz.
  const PracticeResult(
      {required this.mistakes,
      required this.score,
      required this.practiceEndReason});

  @override
  List<Object?> get props => [mistakes, score, practiceEndReason];
}
