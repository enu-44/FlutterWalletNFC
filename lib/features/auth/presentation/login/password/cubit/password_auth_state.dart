abstract class PasswordAuthState {
  PasswordAuthState();
  factory PasswordAuthState.initial() => _PasswordAuthInitial();
  factory PasswordAuthState.loading() => PasswordAuthLoading();
  factory PasswordAuthState.success() => PasswordAuthSuccess();
  factory PasswordAuthState.failure() => PasswordAuthFailure();
}

class _PasswordAuthInitial extends PasswordAuthState {}

class PasswordAuthLoading extends PasswordAuthState {}

class PasswordAuthSuccess extends PasswordAuthState {}

class PasswordAuthFailure extends PasswordAuthState {}
