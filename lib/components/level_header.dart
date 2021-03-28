import 'package:flutter/material.dart';

/// Header with information about a level.
class LevelHeader extends StatelessWidget {
  /// IconData for the icon.
  final String imagePath;

  /// Text of title.
  final String title;

  /// Text of subtitle.
  final String? subtitle;

  /// Callback when this is tapped.
  final VoidCallback? onTap;

  /// Header with information about a level.
  const LevelHeader(
      {required this.imagePath,
      required this.title,
      this.subtitle,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(imagePath),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              if (subtitle != null)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(subtitle!),
                ),
            ],
          )
        ],
      ),
    );
  }
}
