import '../../data/worlds/worlds.dart';
import '../../model/learn_structure.dart';
import 'learn_structure_repository.dart';

/// Learn structure stored locally.
class LocalLearnStructureRepository implements LearnStructureRepository {
  @override
  Future<LearnStructure> get loadStructure async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return const LearnStructure(worlds: worlds);
  }
}
