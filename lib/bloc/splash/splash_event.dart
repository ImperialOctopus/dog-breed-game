import 'package:equatable/equatable.dart';

/// Event for splash bloc.
abstract class SplashEvent extends Equatable {
  /// Event for splash bloc.
  const SplashEvent();
}

/// Start splash screen load.
class SplashEventLoad extends SplashEvent {
  /// Start splash screen load.
  const SplashEventLoad();

  @override
  List<Object?> get props => [];
}
