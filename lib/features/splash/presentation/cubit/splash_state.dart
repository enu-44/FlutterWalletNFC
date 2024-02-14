abstract class SplashState {
  SplashState();
  factory SplashState.initial() => _SplashInitial();
  factory SplashState.finished() => SplashEnd();
}

class _SplashInitial extends SplashState {}

class SplashEnd extends SplashState {}
