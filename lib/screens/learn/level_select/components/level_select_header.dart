import 'package:flutter/material.dart';

import '../../../../model/learn/world.dart';

/// Header for level select page.
class LevelSelectHeader extends StatelessWidget {
  /// World this header represents.
  final World world;

  /// Header for level select page.
  const LevelSelectHeader({required this.world});

  static const double _padding = 10;

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
              padding: const EdgeInsets.symmetric(horizontal: _padding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(world.title),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
