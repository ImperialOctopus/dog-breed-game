/// Progress in a single level.
class LevelProgress {
  /// ID of the level.
  final int levelId;

  /// List representing completed lessons.
  final Iterable<bool> _lessonProgress;

  /// List representing high scores in quizzes.
  final Iterable<double> _quizProgress;

  static const bool _defaultLessonProgress = false;

  static const double _defaultQuizProgress = 0;

  /// Progress in a single level.
  const LevelProgress({
    required this.levelId,
    required Iterable<bool> lessonProgress,
    required Iterable<double> quizProgress,
  })   : _lessonProgress = lessonProgress,
        _quizProgress = quizProgress;

  /// LevelProgress with no progress.
  const LevelProgress.zero({required int id})
      : levelId = id,
        _lessonProgress = const [],
        _quizProgress = const [];

  /// Get progress for the lesson at index.
  bool getLessonProgress(int index) =>
      (index >= 0 && index < _lessonProgress.length)
          ? _lessonProgress.elementAt(index)
          : _defaultLessonProgress;

  /// Get progress for the quiz at index.
  double getQuizProgress(int index) =>
      (index >= 0 && index < _quizProgress.length)
          ? _quizProgress.elementAt(index)
          : _defaultQuizProgress;
}
