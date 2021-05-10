import 'package:flutter/material.dart';

/// Header with information about a level.
class LevelHeader extends StatelessWidget {
  /// Leading widget.
  final Widget leading;

  /// Text of title.
  final String title;

  /// Text of subtitle.
  final String? subtitle;

  /// Height.
  final double height;

  /// Callback when this is tapped.
  final VoidCallback? onTap;

  /// Header with information about a level.
  const LevelHeader(
      {required this.leading,
      required this.title,
      this.subtitle,
      this.height = 100,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
            height: height,
            width: 150,
            child: leading,
          ),
          Container(width: 10),
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
