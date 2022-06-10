import 'package:equatable/equatable.dart';

import '../question_difficulty.dart';

/// Settings for a practice quiz.
class QuizSettings extends Equatable {
  /// Number of questions to run. Null equates to no limit.
  final int? questionNumber;

  // Some kind of question filter.

  /// Number of lives to allow.
  final int? lives;

  /// Enable question timer.
  final bool time;

  /// Question difficulty.
  final QuestionDifficulty difficulty;

  /// Settings for a practice quiz.
  const QuizSettings(
      {required this.questionNumber,
      required this.lives,
      required this.time,
      required this.difficulty});

  @override
  List<Object?> get props => [questionNumber, lives, time, difficulty];
}
