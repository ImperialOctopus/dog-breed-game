import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/level/level.dart';
import '../../model/progress/level_progress.dart';
import '../../model/progress/progress.dart';
import '../../repository/progress/progress_repository.dart';

/// Cubit of progress after app loads.
class ProgressCubit extends Cubit<Progress> {
  final ProgressRepository _progressRepository;

  /// Cubit of progress after app loads.
  ProgressCubit(
      {required Progress initial,
      required ProgressRepository progressRepository})
      : _progressRepository = progressRepository,
        super(initial);

  /// Update progress for an activity.
  Future<void> updateProgress(Level level, LevelProgress newProgress) async {
    final _state = state;
    final _previous = _state.getLevel(level);

    if (newProgress.result > _previous.result) {
      final _newProgress = _state.setLevel(level, newProgress);

      emit(_newProgress);
      await _progressRepository.saveProgress(_newProgress);
    }
  }
}
