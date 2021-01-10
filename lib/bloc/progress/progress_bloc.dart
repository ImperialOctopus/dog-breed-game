import '../../model/progress/level_progress.dart';
import '../../repository/quiz_data/quiz_data_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/progress/progress_repository.dart';
import 'progress_event.dart';
import 'progress_state.dart';

/// Bloc to track user progress through levels.
class ProgressBloc extends Bloc<ProgressEvent, ProgressState> {
  final ProgressRepository _progressRepository;
  final QuizDataRepository _quizDataRepository;

  /// Bloc to track user progress through levels.
  ProgressBloc({
    required ProgressRepository progressRepository,
    required QuizDataRepository quizDataRepository,
  })   : _progressRepository = progressRepository,
        _quizDataRepository = quizDataRepository,
        super(const ProgressDefault());

  @override
  Stream<ProgressState> mapEventToState(ProgressEvent event) async* {
    if (event is LoadProgress) {
      yield* _mapLoadToState(event);
    } else if (event is UpdateProgress) {
      yield* _mapUpdateToState(event);
    } else {
      throw FallThroughError();
    }
  }

  Stream<ProgressState> _mapLoadToState(LoadProgress event) async* {
    yield const ProgressLoading();

    try {
      final progress = await Future.wait<LevelProgress>(
          _quizDataRepository.allLevels.map<Future<LevelProgress>>(
              (level) => _progressRepository.readProgressByLevel(level)));

      yield ProgressLoaded(progress: progress);
    } catch (e) {
      yield ProgressLoadError(e.toString());
    }
  }

  Stream<ProgressState> _mapUpdateToState(UpdateProgress event) async* {
    await _progressRepository.updateProgress(event.progress);
    add(const LoadProgress());
  }
}
