import 'package:flutter/material.dart';

/// Asset image with a fixed height and infinite width.
class FixedHeightAssetImage extends StatelessWidget {
  /// Path to the image asset.
  final String imagePath;

  /// Fixed height to fit to.
  final double height;

  /// Asset image with a fixed height and infinite width.
  const FixedHeightAssetImage({
    Key? key,
    required this.imagePath,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: FittedBox(
        fit: BoxFit.cover,
        clipBehavior: Clip.hardEdge,
        child: Image.asset(
          imagePath,
        ),
      ),
    );
  }
}
