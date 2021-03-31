import 'package:flutter/material.dart';

/// Cards for sliding world select.
class SlidingCard extends StatelessWidget {
  /// Tag for hero.
  final Object? heroTag;

  /// Image for top of card.
  final Widget image;

  /// Child widget.
  final Widget child;

  /// Cards for sliding world select.
  const SlidingCard({
    Key? key,
    this.heroTag,
    required this.image,
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
          if (heroTag == null)
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(32)),
              child: image,
            )
          else
            Hero(
              tag: heroTag!,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(32)),
                child: image,
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
