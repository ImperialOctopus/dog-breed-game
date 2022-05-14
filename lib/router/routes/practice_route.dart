import 'package:flutter/material.dart';

import '../../model/practice/practice_settings.dart';
import '../../screens/practice/practice_screen.dart';
import '../provides_page.dart';

/// Practice main route.
class PracticeRoute extends StatelessWidget implements ProvidesPage<void> {
  /// Settings for the quiz.
  final PracticeSettings settings;

  /// Practice main route.
  const PracticeRoute({required this.settings});

  @override
  Widget build(BuildContext context) {
    return PracticeScreen(settings: settings);
  }

  @override
  Page<void> get page => MaterialPage(child: this);
}
