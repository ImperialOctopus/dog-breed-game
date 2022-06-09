/// Result from a quiz attempt.
class KnowledgeCheckResult {
  /// Highest possible score.
  final int maxScore;

  /// Score achieved.
  final int score;

  /// Result from a quiz attempt.
  const KnowledgeCheckResult({required this.score, required this.maxScore});
}
