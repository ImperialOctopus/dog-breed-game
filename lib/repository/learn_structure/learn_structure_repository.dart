import '../../model/learn_structure.dart';

abstract class LearnStructureRepository {
  Future<LearnStructure> get loadStructure;
}
