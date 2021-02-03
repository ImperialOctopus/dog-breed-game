import 'package:flutter/material.dart';

/// Header with information about a level.
class LevelHeader extends StatelessWidget {
  /// IconData for the icon.
  final Widget icon;

  /// Text of title.
  final Widget title;

  /// Text of subtitle.
  final Widget? subtitle;

  /// Header with information about a level.
  const LevelHeader({required this.icon, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            height: 100,
            width: 100,
            child: icon,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            title,
            if (subtitle != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: subtitle,
              ),
          ],
        )
      ],
    );
  }
}
