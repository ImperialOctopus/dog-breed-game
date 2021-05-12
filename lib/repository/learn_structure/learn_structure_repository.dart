import '../../model/learn_structure.dart';

/// Repository for learn structure.
abstract class LearnStructureRepository {
  /// Load the learn structure.
  Future<LearnStructure> get loadStructure;
}
