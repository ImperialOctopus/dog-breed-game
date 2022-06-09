import 'package:flutter/material.dart';

import '../../../model/learn/lesson.dart';
import 'components/lesson_complete_button.dart';
import 'components/lesson_header.dart';

/// One page of a lesson.
class LessonPage extends StatelessWidget {
  /// Containing lesson.
  final Lesson lesson;

  /// Content for this page.
  final int index;

  /// Whether to add the first page header.
  final bool? addHeader;

  static const double _padding = 20;

  /// One page of a lesson.
  const LessonPage({
    required this.lesson,
    required this.index,
    this.addHeader,
  });

  @override
  Widget build(BuildContext context) {
    final _addHeader = addHeader ?? (index == 0);

    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (_addHeader)
          LessonHeader(lesson: lesson)
        else
          const SizedBox(height: _padding),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: _padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: lesson.content[index],
          ),
        ),
      ],
    ));
  }
}
