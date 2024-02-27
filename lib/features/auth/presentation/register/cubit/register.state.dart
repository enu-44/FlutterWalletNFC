abstract class RegisterState {
  RegisterState({this.message = ''});
  final String message;
  factory RegisterState.initial() => _RegisterInitial();
  factory RegisterState.loading() => RegisterLoading();
  factory RegisterState.success() => RegisterSuccess();
  factory RegisterState.failure() => RegisterFailure();
}

class _RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {
  RegisterLoading({super.message = "Cargando..."});
}

class RegisterSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {
  RegisterFailure({super.message = "Ocurrio un error al crear la cuenta"});
}
