import 'package:flutter/material.dart';

import 'lesson.dart';
import 'quiz/quiz.dart';

/// Model of a level.
class Level {
  /// Unique identifier of a level.
  final int id;

  /// Title of lesson.
  final String title;

  /// Subtitle of lesson.
  final String? subtitle;

  /// IconData for this level's icon.
  final IconData iconData;

  /// Image to summarise lesson.
  final String imagePath;

  /// Lesson description.
  final String description;

  /// This level's lesson.
  final Lesson? lesson;

  /// This level's quiz
  final Quiz? quiz;

  /// [title] is displayed at the top of the card. [subtitle] is below it.
  /// [image] represents the whole lesson. [description] describes the content
  /// of the lesson
  const Level({
    required this.id,
    required this.title,
    this.subtitle,
    required this.iconData,
    required this.imagePath,
    required this.description,
    this.lesson,
    this.quiz,
  });
}
