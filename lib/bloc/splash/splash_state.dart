import 'package:equatable/equatable.dart';

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
  /// Loading saved data.
  const SplashStateLoading();

  @override
  List<Object?> get props => [];
}

/// Data loaded.
class SplashStateLoaded extends SplashState {
  /// Progress for the app.
  final Progress progress;

  /// Data loaded.
  const SplashStateLoaded({required this.progress});

  @override
  List<Object?> get props => [progress];
}
