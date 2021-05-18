import 'package:flutter/material.dart';

import '../../../model/level/lesson.dart';
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

  /// Whether to add the complete button.
  final bool? addCompleteButton;

  static const double _padding = 20;

  /// One page of a lesson.
  const LessonPage(
      {required this.lesson,
      required this.index,
      this.addHeader,
      this.addCompleteButton});

  @override
  Widget build(BuildContext context) {
    final _addHeader = addHeader ?? (index == 0);
    final _addCompleteButton =
        addCompleteButton ?? (index == lesson.content.length - 1);

    return Padding(
      padding: EdgeInsets.only(
        top: _addHeader ? 0 : _padding,
        left: _padding,
        right: _padding,
        bottom: _padding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (_addHeader) LessonHeader(),
          ...lesson.content[index],
          if (_addCompleteButton) LessonCompleteButton(),
        ],
      ),
    );
  }
}
