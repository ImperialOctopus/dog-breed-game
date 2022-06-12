import 'package:flutter/material.dart';

import '../../../../model/learn/lesson.dart';

/// Header for the first page of a lesson.
class LessonHeader extends StatelessWidget {
  /// Lesson this heads.
  final Lesson lesson;

  /// Header for the first page of a lesson.
  const LessonHeader({required this.lesson});

  static const double _height = 150;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      child: Image.asset(lesson.imagePath, fit: BoxFit.cover),
    );
  }
}
