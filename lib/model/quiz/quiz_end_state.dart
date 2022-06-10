/// Reason for practice ending.
enum QuizEndState {
  /// Not finished yet.
  notFinished,

  /// Ran out of lives.
  outOfLives,

  /// Ran out of time in a timed quiz.
  outOfTime,

  /// Ran out of questions.
  outOfQuestions,

  /// User ended quiz early.
  userCondeded,
}
