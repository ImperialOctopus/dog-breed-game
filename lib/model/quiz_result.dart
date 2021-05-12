/// Result from a quiz attempt.
class QuizResult {
  /// Highest possible score.
  final int maxScore;

  /// Score achieved.
  final int score;

  /// Result from a quiz attempt.
  const QuizResult({required this.score, required this.maxScore});
}
