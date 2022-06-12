import 'package:flutter/material.dart';

import 'transitions/default_transition.dart';

/// Provides a Flutter navigation page.
mixin ProvidesPage<T> on Widget {
  /// Page for this route.
  Page<T> get page => DefaultTransition<T>(child: this);
}
