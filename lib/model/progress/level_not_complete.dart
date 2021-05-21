import 'level_progress.dart';

/// Level not complete.
class LevelNotComplete extends LevelProgress {
  /// Level not complete.
  const LevelNotComplete();

  @override
  bool get complete => false;

  @override
  double get result => 0;
}
