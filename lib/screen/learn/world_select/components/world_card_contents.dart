import 'package:flutter/material.dart';

import '../../../../components/world_progress_cubit_builder.dart';
import '../../../../model/world.dart';

/// Contents for world card.
class WorldCardContents extends StatelessWidget {
  /// World to describe.
  final World world;

  /// Callback for button.
  final VoidCallback? onPressed;

  static const double _startButtonBorderRadius = 16;

  /// Contents for world card.
  const WorldCardContents({required this.world, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(world.title, style: const TextStyle(fontSize: 20)),
        if (world.subtitle != null) ...[
          const SizedBox(height: 8),
          Text(world.subtitle!, style: const TextStyle(color: Colors.grey)),
        ],
        Text(world.description),
        const Spacer(),
        Row(
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                //textStyle: TextStyle(color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(_startButtonBorderRadius),
                ),
              ),
              onPressed: onPressed,
              child: const Text('Start'),
            ),
            const Spacer(),
            WorldProgressCubitBuilder(
              worldLabel: world.label,
              builder: (context, progress) => Text(
                (progress.result * 100).round().toString() + '\% Complete',
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(width: 16),
          ],
        )
      ],
    );
  }
}
