import 'package:flutter/material.dart';

/// Cards for sliding world select.
class SlidingCard extends StatelessWidget {
  /// Path to image asset.
  final String imagePath;

  /// Child widget.
  final Widget child;

  /// Cards for sliding world select.
  const SlidingCard({
    Key? key,
    required this.imagePath,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 24),
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
