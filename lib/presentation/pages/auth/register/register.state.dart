abstract class RegisterState {
  RegisterState();
  factory RegisterState.initial() => _RegisterInitial();
  factory RegisterState.loading() => _RegisterLoading();
  factory RegisterState.success() => _RegisterSuccess();
  factory RegisterState.failure() => _RegisterFailure();
}

class _RegisterInitial extends RegisterState {}

class _RegisterLoading extends RegisterState {}

class _RegisterSuccess extends RegisterState {}

class _RegisterFailure extends RegisterState {}
