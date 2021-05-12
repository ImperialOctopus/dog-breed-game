import 'package:equatable/equatable.dart';

import '../../model/learn_structure.dart';
import '../../model/progress/progress.dart';

/// State for splash bloc.
abstract class SplashState extends Equatable {
  /// State for splash bloc.
  const SplashState();
}

/// Initial state.
class SplashStateInitial extends SplashState {
  /// Initial state.
  const SplashStateInitial();

  @override
  List<Object?> get props => [];
}

/// Loading saved data.
class SplashStateLoading extends SplashState {
  /// Message to display on loading screen.
  final String? loadingMessage;

  /// Loading saved data.
  const SplashStateLoading([this.loadingMessage]);

  @override
  List<Object?> get props => [loadingMessage];
}

/// Data loaded.
class SplashStateLoaded extends SplashState {
  /// Progress for the app.
  final Progress progress;

  /// Structure for app.
  final LearnStructure structure;

  /// Data loaded.
  const SplashStateLoaded({
    required this.progress,
    required this.structure,
  });

  @override
  List<Object?> get props => [progress, structure];
}
