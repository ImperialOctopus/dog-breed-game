import 'package:flutter/material.dart';

/// Provides a Flutter navigation page.
abstract class ProvidesPage<T> {
  /// Page for this route.
  Page<T> get page;
}
