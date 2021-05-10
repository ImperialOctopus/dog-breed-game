import 'package:flutter/material.dart';

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
              child: const Text('Start'),
              style: ElevatedButton.styleFrom(
                //primary: const Color(0xFF162A49),
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(_startButtonBorderRadius),
                ),
              ),
              onPressed: onPressed,
            ),
            const Spacer(),
            const Text(
              '59\% Complete',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 20,
              ),
            ),
            const SizedBox(width: 16),
          ],
        )
      ],
    );
  }
}
