import 'package:equatable/equatable.dart';

/// Settings for a practice quiz.
class PracticeSettings extends Equatable {
  /// Number of questions to run. Zero equates to infinite.
  final int questionNumber;

  /// Number of lives to allow. Zero equates to no limit.
  final int lives;

  /// Enable question timer.
  final bool time;

  /// Question difficulty.
  final int difficulty;

  /// Settings for a practice quiz.
  const PracticeSettings(
      {required this.questionNumber,
      required this.lives,
      required this.time,
      required this.difficulty});

  /// Settings for a practice quiz.
  PracticeSettings copyWith(
          {int? questionNumber, int? lives, bool? time, int? difficulty}) =>
      PracticeSettings(
        questionNumber: questionNumber ?? this.questionNumber,
        lives: lives ?? this.lives,
        time: time ?? this.time,
        difficulty: difficulty ?? this.difficulty,
      );

  @override
  List<Object?> get props => [questionNumber, lives, time, difficulty];
}
