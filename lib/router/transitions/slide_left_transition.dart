import 'package:flutter/material.dart';

/// Page wrapper for slide left transition.
class SlideLeftTransition<T> extends MaterialPage<T> {
  /// Child widget.
  @override
  final Widget child;

  /// Page wrapper for slide left transition.
  SlideLeftTransition({required this.child, LocalKey? key})
      : super(child: child, key: key ?? ObjectKey(child));

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
