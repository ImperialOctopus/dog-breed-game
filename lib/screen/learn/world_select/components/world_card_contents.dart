import 'package:flutter/material.dart';

/// Contents for world card.
class WorldCardContents extends StatelessWidget {
  /// Title
  final String title;

  /// Subtitle
  final String? subtitle;

  /// Callback for button.
  final VoidCallback? onPressed;

  /// Contents for world card.
  const WorldCardContents({required this.title, this.subtitle, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: const TextStyle(fontSize: 20)),
        if (subtitle != null) ...[
          const SizedBox(height: 8),
          Text(subtitle!, style: const TextStyle(color: Colors.grey)),
        ],
        const Spacer(),
        Row(
          children: <Widget>[
            ElevatedButton(
              child: const Text('Reserve'),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF162A49),
                textStyle: const TextStyle(
                  color: Colors.white,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              onPressed: onPressed,
            ),
            const Spacer(),
            const Text(
              '0.00 \$',
              style: TextStyle(
                fontWeight: FontWeight.bold,
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
