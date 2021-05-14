import 'package:flutter/material.dart';

import '../../../../components/world_progress_cubit_builder.dart';
import '../../../../model/world.dart';

/// Header for level select page.
class LevelSelectHeader extends StatelessWidget {
  /// World this header represents.
  final World world;

  /// Header for level select page.
  const LevelSelectHeader({required this.world});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Theme.of(context).cardColor,
      elevation: 2,
      child: Row(
        children: [
          SizedBox(
            height: 70,
            width: 150,
            child: Hero(
              tag: world,
              child: Image.asset(world.imagePath, fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(world.title),
                  WorldProgressCubitBuilder(
                    worldLabel: world.label,
                    builder: (context, progress) => Text(
                      (progress.result * 100).round().toString() +
                          '\% Complete',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
