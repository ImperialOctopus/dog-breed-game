import 'package:flutter/material.dart';

import '../../screens/practice/practice_settings_screen.dart';
import '../provides_page.dart';

/// Practice main route.
class PracticeSettingsRoute extends StatelessWidget
    implements ProvidesPage<void> {
  /// Practice main route.
  const PracticeSettingsRoute();

  @override
  Widget build(BuildContext context) {
    return const QuizSettingsScreen();
  }

  @override
  Page<void> get page => MaterialPage(child: this);
}
