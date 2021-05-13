import 'progress_item.dart';

/// Level with a score.
class ProgressItemScore extends ProgressItem {
  /// Minimum result required to count as passed.
  static const passMark = 0.6;

  /// Maximum score.
  final int maxScore;

  /// Score achieved.
  final int score;

  /// Level with a score.
  const ProgressItemScore(this.score, this.maxScore);

  @override
  bool get complete => result > passMark;

  @override
  double get result => score / maxScore;
}
