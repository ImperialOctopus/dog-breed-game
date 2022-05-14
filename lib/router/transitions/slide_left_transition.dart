import 'package:flutter/material.dart';

/// Page wrapper for slide left transition.
class SlideLeftTransition<T> extends Page<T> {
  /// Child widget.
  final Widget child;

  /// Page wrapper for slide left transition.
  const SlideLeftTransition({required this.child});

  @override
  Route<T> createRoute(BuildContext context) {
    return PageRouteBuilder<T>(
      settings: this,
      pageBuilder: (context, animation, animation2) {
        final tween = Tween(begin: const Offset(1.0, 0.0), end: Offset.zero);
        final curveTween = CurveTween(curve: Curves.easeInOut);
        return SlideTransition(
          position: animation.drive(curveTween).drive(tween),
          child: child,
        );
      },
    );
  }
}
