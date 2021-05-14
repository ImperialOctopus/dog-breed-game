import 'package:flutter/material.dart';

/// Indicator for PageView pages.
class PageIndicator extends StatelessWidget {
  //static const _activeColor = Colors.blue;
  static const _inactiveColor = Colors.grey;

  /// Whether this page is active.
  final bool isActive;

  /// [isActive] controls colour of this.
  const PageIndicator(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 12 : 8,
      width: isActive ? 12 : 8,
      decoration: BoxDecoration(
        color: isActive ? Theme.of(context).primaryColor : _inactiveColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: isActive ? Border.all(width: 1, color: _inactiveColor) : null,
      ),
    );
  }
}
