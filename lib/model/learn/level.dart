import 'package:equatable/equatable.dart';

/// Base class for menu option inside worlds in the learn mode.
abstract class Level extends Equatable {
  /// Base class for menu option inside worlds in the learn mode.
  const Level();

  /// Title of lesson.
  String get title;

  /// Subtitle of lesson.
  String? get subtitle;

  /// Icon image path.
  String get imagePath;
}
