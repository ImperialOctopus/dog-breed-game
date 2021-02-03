import '../../component/level/level.dart';

/// Repository providing data for quiz.
abstract class QuizDataRepository {
  /// List of all levels.
  List<Level> get allLevels;
}
