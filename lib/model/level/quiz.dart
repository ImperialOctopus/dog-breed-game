import '../questions/question.dart';
import 'level.dart';

/// Data for a quiz.
class Quiz implements Level {
  /// List of questions.
  final List<Question> questions;

  @override
  final String title;

  @override
  final String? subtitle;

  @override
  final String imagePath;

  @override
  final String label;

  /// Data for a quiz.
  const Quiz({
    required this.label,
    required this.title,
    this.subtitle,
    required this.imagePath,
    required this.questions,
  });
}
