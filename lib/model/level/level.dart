/// Model of a level.
abstract class Level {
  /// Unique identifier of a level.
  String get label;

  /// Title of lesson.
  String get title;

  /// Subtitle of lesson.
  String? get subtitle;

  /// Icon image path.
  String get imagePath;

  /// [title] is displayed at the top of the card. [subtitle] is below it.
  /// [icon] is shown to the left of the title. [id] is used to store lesson
  /// progress.
  const Level();
}
