import 'package:flutter/material.dart';

/// Header with information about a level.
class LevelHeader extends StatelessWidget {
  /// IconData for the icon.
  final IconData iconData;

  /// Text of title.
  final String title;

  /// Text of subtitle.
  final String? subtitle;

  /// Header with information about a level.
  const LevelHeader(
      {required this.iconData, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(
            Icons.text_rotate_up_sharp,
            size: 100,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
            if (subtitle != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  subtitle!,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
          ],
        )
      ],
    );
  }
}
