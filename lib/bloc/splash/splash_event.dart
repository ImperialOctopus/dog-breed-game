import 'package:equatable/equatable.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();
}

class SplashEventLoad extends SplashEvent {
  const SplashEventLoad();

  @override
  List<Object?> get props => [];
}
