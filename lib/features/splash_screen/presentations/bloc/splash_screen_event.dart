part of 'splash_screen_bloc.dart';

sealed class SplashScreenEvent extends Equatable {
  const SplashScreenEvent();

  @override
  List<Object> get props => [];
}

class StartSplashScreenEvent extends SplashScreenEvent {
  final BuildContext context;

  const StartSplashScreenEvent(this.context);

  @override
  List<Object> get props => [context];
}
