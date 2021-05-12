import 'progress_item.dart';

/// Level not complete.
class ProgressItemNone extends ProgressItem {
  /// Level not complete.
  const ProgressItemNone();

  @override
  bool get complete => false;

  @override
  double get result => 0;
}
