abstract class PhoneAuthState {
  PhoneAuthState();
  factory PhoneAuthState.initial() => _PhoneAuthInitial();
  factory PhoneAuthState.loading() => PhoneAuthLoading();
  factory PhoneAuthState.success() => PhoneAuthSuccess();
  factory PhoneAuthState.failure() => PhoneAuthFailure();
}

class _PhoneAuthInitial extends PhoneAuthState {}

class PhoneAuthLoading extends PhoneAuthState {}

class PhoneAuthSuccess extends PhoneAuthState {}

class PhoneAuthFailure extends PhoneAuthState {}
