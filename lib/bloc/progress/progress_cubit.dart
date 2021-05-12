import 'package:flutter_bloc/flutter_bloc.dart';

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
}
