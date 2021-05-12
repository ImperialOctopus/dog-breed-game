import 'progress_item.dart';

/// Level complete.
class ProgressItemComplete extends ProgressItem {
  /// Level complete.
  const ProgressItemComplete();

  @override
  bool get complete => true;

  @override
  double get result => 1;
}
