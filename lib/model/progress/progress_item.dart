/// Progress for a level.
abstract class ProgressItem {
  /// Whether this item is complete.
  bool get complete;

  /// Score percentage.
  double get result;

  /// Progress for a level.
  const ProgressItem();
}
