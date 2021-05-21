import 'level_progress.dart';

/// Level complete.
class LevelComplete extends LevelProgress {
  /// Level complete.
  const LevelComplete();

  @override
  bool get complete => true;

  @override
  double get result => 1;
}
