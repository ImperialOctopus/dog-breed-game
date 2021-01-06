import 'lesson.dart';
import 'quiz/quiz.dart';

/// Model of a level.
class Level {
  /// Title of lesson.
  final String title;

  /// Subtitle of lesson.
  final String subtitle;

  /// Image to summarise lesson.
  final String imagePath;

  /// Lesson description.
  final String description;

  /// This level's lesson.
  final Lesson lesson;

  /// This level's quiz
  final Quiz quiz;

  /// [title] is displayed at the top of the card. [subtitle] is below it.
  /// [image] represents the whole lesson. [description] describes the content
  /// of the lesson
  const Level({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.description,
    required this.lesson,
    required this.quiz,
  });
}
