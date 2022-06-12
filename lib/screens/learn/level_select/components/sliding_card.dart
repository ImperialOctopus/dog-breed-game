import 'package:flutter/material.dart';

/// Cards for sliding world select.
class SlidingCard extends StatelessWidget {
  /// Image for top of card.
  final Widget image;

  /// Child widget.
  final Widget child;

  /// Default border radius for cards.
  static const double borderRadius = 16;

  /// Cards for sliding world select.
  const SlidingCard({
    Key? key,
    required this.image,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 8, right: 8, bottom: 24),
      elevation: 8,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius)),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(borderRadius)),
            child: image,
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
