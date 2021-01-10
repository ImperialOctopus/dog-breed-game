/// Progress in a single level.
class LevelProgress {
  /// ID of the level.
  final int id;

  /// Completed lesson.
  final bool lessonComplete;

  /// High score in quiz.
  final double quizScore;

  /// Progress in a single level.
  const LevelProgress({
    required this.id,
    required this.lessonComplete,
    required this.quizScore,
  });

  /// LevelProgress with no progress.
  const LevelProgress.zero({required this.id})
      : lessonComplete = false,
        quizScore = 0;

  /// Copy this object with properties changed.
  LevelProgress copyWith({int? id, bool? lessonComplete, double? quizScore}) =>
      LevelProgress(
        id: id ?? this.id,
        lessonComplete: lessonComplete ?? this.lessonComplete,
        quizScore: quizScore ?? this.quizScore,
      );
}
