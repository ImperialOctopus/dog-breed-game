import 'package:flutter/material.dart';

import '../../../../model/progress/level_progress.dart';
import '../../../../model/progress/level_scored.dart';

/// Indicator of progress through a level.
class LevelProgressIndicator extends StatelessWidget {
  /// Progress to indicate.
  final LevelProgress progress;

  /// Indicator of progress through a level.
  const LevelProgressIndicator({required this.progress});

  static const double _spacing = 10;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (progress is LevelScored)
          Padding(
            padding: const EdgeInsets.only(right: _spacing),
            child: Text((progress.result * 100).round().toString() + '\%'),
          ),
        progress.complete ? const Icon(Icons.check) : const Icon(Icons.close),
      ],
    );
  }
}
