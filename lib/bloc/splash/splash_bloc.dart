import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/progress/progress_repository.dart';
import 'splash_event.dart';
import 'splash_state.dart';

/// Bloc for splash screen.
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final ProgressRepository _progressRepository;

  /// Bloc for splash screen.
  SplashBloc({required ProgressRepository progressRepository})
      : _progressRepository = progressRepository,
        super(const SplashStateInitial());

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if (event is SplashEventLoad) {
      yield const SplashStateLoading();
      final _progress = await _progressRepository.loadProgress;
      yield SplashStateLoaded(progress: _progress);
      return;
    }
    throw FallThroughError();
  }
}
