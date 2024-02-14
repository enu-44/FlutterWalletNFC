abstract class RegisterState {
  RegisterState();
  factory RegisterState.initial() => _RegisterInitial();
  factory RegisterState.loading() => RegisterLoading();
  factory RegisterState.success() => RegisterSuccess();
  factory RegisterState.failure() => RegisterFailure();
}

class _RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {}
