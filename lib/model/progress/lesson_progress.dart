import 'level_progress.dart';

class LessonProgress extends LevelProgress {
  @override
  final String id;

  @override
  final bool complete;

  LessonProgress({
    required this.id,
    this.complete = false,
  });
}
