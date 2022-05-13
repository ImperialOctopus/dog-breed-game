import 'package:flutter/material.dart';

import '../../screens/practice/quiz_settings_screen.dart';
import '../provides_page.dart';

/// Practice main route.
class QuizRoute extends StatelessWidget implements ProvidesPage<void> {
  /// Practice main route.
  const QuizRoute();

  @override
  Widget build(BuildContext context) {
    return const QuizSettingsScreen();
  }

  @override
  Page<void> get page => MaterialPage(child: this);
}
