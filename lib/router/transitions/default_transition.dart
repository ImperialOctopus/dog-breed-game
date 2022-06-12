import 'package:flutter/material.dart';

/// Page wrapping a default page transition.
class DefaultTransition<T> extends MaterialPage<T> {
  /// Page wrapper for slide left transition.
  DefaultTransition({required Widget child, LocalKey? key})
      : super(child: child, key: key ?? ObjectKey(child));
}
