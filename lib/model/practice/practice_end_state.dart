/// Reason for practice ending.
enum PracticeEndState {
  /// Not finished yet.
  continuing,

  /// Ran out of lives.
  lives,

  /// Ran out of time in a timed quiz.
  time,

  /// Ran out of questions.
  questions,

  /// User ended quiz early.
  concede,
}
