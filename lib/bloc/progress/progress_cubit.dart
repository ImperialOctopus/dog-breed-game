import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/progress/progress.dart';
import '../../model/progress/progress_item.dart';
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
  Future<void> updateProgress(
      String worldLabel, String levelLabel, ProgressItem progressItem) async {
    final _state = state;
    final _previous = _state.getWorld(worldLabel).getLevel(levelLabel);

    if (progressItem.result > _previous.result) {
      final _newProgress = _state.replaceWorld(
        worldLabel,
        (worldProgress) => worldProgress.replaceLevel(
            levelLabel, (levelProgress) => progressItem),
      );

      emit(_newProgress);
      await _progressRepository.saveProgress(_newProgress);
    }
  }
}
