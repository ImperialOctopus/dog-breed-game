import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/learn_structure/learn_structure_repository.dart';
import '../../repository/progress/progress_repository.dart';
import 'splash_event.dart';
import 'splash_state.dart';

/// Bloc for splash screen.
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final ProgressRepository _progressRepository;
  final LearnStructureRepository _learnStructureRepository;

  /// Bloc for splash screen.
  SplashBloc(
      {required ProgressRepository progressRepository,
      required LearnStructureRepository learnStructureRepository})
      : _learnStructureRepository = learnStructureRepository,
        _progressRepository = progressRepository,
        super(const SplashStateInitial());

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if (event is SplashEventLoad) {
      yield const SplashStateLoading('Loading progress...');
      final _progress = await _progressRepository.loadProgress;
      yield const SplashStateLoading('Loading app structure...');
      final _structure = await _learnStructureRepository.loadStructure;
      yield const SplashStateLoading('Migrating save data...');
      final _migrated =
          await _progressRepository.migrateProgress(_progress, _structure);
      yield SplashStateLoaded(progress: _migrated, structure: _structure);
      return;
    }
    throw FallThroughError();
  }
}
