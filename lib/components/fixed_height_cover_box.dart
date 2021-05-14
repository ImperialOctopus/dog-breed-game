import 'package:flutter/material.dart';

/// Asset image with a fixed height and infinite width.
class FixedHeightCoverBox extends StatelessWidget {
  /// Path to the image asset.
  final Widget child;

  /// Fixed height to fit to.
  final double height;

  /// Asset image with a fixed height and infinite width.
  const FixedHeightCoverBox({
    Key? key,
    required this.height,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: FittedBox(
        fit: BoxFit.cover,
        clipBehavior: Clip.hardEdge,
        child: child,
      ),
    );
  }
}
