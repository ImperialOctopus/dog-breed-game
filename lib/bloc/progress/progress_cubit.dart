import 'package:dog_breed_game/model/progress/progress.dart';
import 'package:dog_breed_game/repository/progress/progress_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Cubit of progress after app loads.
class ProgressCubit extends Cubit<Progress> {
  final ProgressRepository _progressRepository;

  /// Cubit of progress after app loads.
  ProgressCubit(
      {required Progress initial,
      required ProgressRepository progressRepository})
      : _progressRepository = progressRepository,
        super(initial);
}
