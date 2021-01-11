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
      return;
    }
    if (event is UpdateProgress) {
      yield* _mapUpdateToState(event);
      return;
    }

    if (event is QuizCompleted) {
      yield* _mapQuizCompletedToState(event);
      return;
    }
    if (event is LessonCompleted) {
      yield* _mapLessonCompletedToState(event);
      return;
    }
    throw FallThroughError();
  }

  Stream<ProgressState> _mapLoadToState(LoadProgress event) async* {
    yield const ProgressLoading();

    final progress = <LevelProgress>[];

    for (final level in _quizDataRepository.allLevels) {
      progress.add(await _progressRepository.readProgressByLevel(level));
    }

    yield ProgressLoaded(progress: progress);
    //catch (e) {
    //yield ProgressLoadError(e.toString());
  }

  Stream<ProgressState> _mapUpdateToState(UpdateProgress event) async* {
    await _progressRepository.updateProgress(event.progress);
    add(const LoadProgress());
  }

  Stream<ProgressState> _mapQuizCompletedToState(QuizCompleted event) async* {
    final _state = state;
    if (_state is ProgressLoaded) {
      final progress = _state.getProgressById(event.levelId);
      if (event.score > progress.quizScore) {
        add(UpdateProgress(
            progress: progress.copyWith(quizScore: event.score)));
      }
    }
  }

  Stream<ProgressState> _mapLessonCompletedToState(
      LessonCompleted event) async* {
    final _state = state;
    if (_state is ProgressLoaded) {
      final progress = _state.getProgressById(event.levelId);
      if (!progress.lessonComplete) {
        add(UpdateProgress(progress: progress.copyWith(lessonComplete: true)));
      }
    }
  }
}
