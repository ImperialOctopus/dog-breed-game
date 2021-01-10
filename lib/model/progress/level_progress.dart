/// Progress in a single level.
class LevelProgress {
  /// ID of the level.
  final int levelId;

  /// List representing completed lessons.
  final List<bool> lessonProgress;

  /// List representing high scores in quizzes.
  final List<double> quizProgress;

  /// Progress in a single level.
  const LevelProgress({
    required this.levelId,
    required this.lessonProgress,
    required this.quizProgress,
  });
}
