import '../data/levels/levels.dart';
import '../model/level.dart';
import 'quiz_data_repository.dart';

/// Quiz data repo using local data.
class LocalQuizDataRepository implements QuizDataRepository {
  /// Quiz data repo using local data.
  const LocalQuizDataRepository();

  @override
  List<Level> get allLevels => levels;
}
