import '../quiz/quiz_settings.dart';
import 'has_menu_item.dart';
import 'level.dart';

/// Data for a quiz.
class KnowledgeCheck implements HasMenuItem {
  @override
  final String title;

  @override
  final String? subtitle;

  @override
  final String imagePath;

  @override
  final String label;

  /// Settings for the quiz.
  final QuizSettings quizSettings;

  /// Data for a quiz.
  const KnowledgeCheck({
    required this.label,
    required this.title,
    this.subtitle,
    required this.imagePath,
    required this.quizSettings,
  });
}
