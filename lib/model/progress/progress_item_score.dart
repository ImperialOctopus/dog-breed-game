import 'progress_item.dart';

/// Level with a score.
class ProgressItemScore extends ProgressItem {
  /// Maximum score.
  final int maxScore;

  /// Score achieved.
  final int score;

  /// Level with a score.
  const ProgressItemScore(this.score, this.maxScore);

  @override
  bool get complete => score != 0;

  @override
  double get result => score / maxScore;
}
