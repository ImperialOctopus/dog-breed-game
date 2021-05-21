import 'level_progress.dart';

/// Level with a score.
class LevelScored extends LevelProgress {
  /// Minimum result required to count as passed.
  static const passMark = 0.6;

  /// Maximum score.
  final int maxScore;

  /// Score achieved.
  final int score;

  /// Level with a score.
  const LevelScored(this.score, this.maxScore);

  @override
  bool get complete => result > passMark;

  @override
  double get result => score / maxScore;
}
