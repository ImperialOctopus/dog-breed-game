import 'package:equatable/equatable.dart';

abstract class SplashEvent extends Equatable {
  const SplashEvent();
}

class SplashEventLoad extends Equatable {
  const SplashEventLoad();

  @override
  List<Object?> get props => [];
}
