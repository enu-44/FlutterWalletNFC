abstract class PasswordAuthState {
  PasswordAuthState({this.message = ''});
  final String message;
  factory PasswordAuthState.initial() => _PasswordAuthInitial();
  factory PasswordAuthState.loading() => PasswordAuthLoading();
  factory PasswordAuthState.success() => PasswordAuthSuccess();
  factory PasswordAuthState.failure() => PasswordAuthFailure();
}

class _PasswordAuthInitial extends PasswordAuthState {}

class PasswordAuthLoading extends PasswordAuthState {
  PasswordAuthLoading({super.message = "Cargando..."});
}

class PasswordAuthSuccess extends PasswordAuthState {}

class PasswordAuthFailure extends PasswordAuthState {
  PasswordAuthFailure(
      {super.message = "Contraseña no valida, vuelve a intentarlo"});
}
