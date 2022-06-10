import 'knowledge_check.dart';
import 'lesson.dart';

/// Can generate a menu item for this.
mixin HasMenuItem on KnowledgeCheck, Lesson {
  /// Unique identifier of a level.
  String get label;

  /// Title of lesson.
  String get title;

  /// Subtitle of lesson.
  String? get subtitle;

  /// Icon image path.
  String get imagePath;
}
