/// Model of a level.
abstract class Level {
  /// Unique identifier of a level.
  final int id;

  /// Title of lesson.
  final String title;

  /// Subtitle of lesson.
  final String? subtitle;

  /// Icon image path.
  final String imagePath;

  /// [title] is displayed at the top of the card. [subtitle] is below it.
  /// [icon] is shown to the left of the title. [id] is used to store lesson
  /// progress.
  const Level({
    required this.id,
    required this.title,
    this.subtitle,
    required this.imagePath,
  });
}
