abstract class PhoneAuthState {
  PhoneAuthState({this.message = ''});
  final String message;
  factory PhoneAuthState.initial() => _PhoneAuthInitial();
  factory PhoneAuthState.loading() => PhoneAuthLoading();
  factory PhoneAuthState.success() => PhoneAuthSuccess();
  factory PhoneAuthState.failure() => PhoneAuthFailure();
}

class _PhoneAuthInitial extends PhoneAuthState {}

class PhoneAuthLoading extends PhoneAuthState {
  PhoneAuthLoading({super.message = "Cargando..."});
}

class PhoneAuthSuccess extends PhoneAuthState {}

class PhoneAuthFailure extends PhoneAuthState {
  PhoneAuthFailure(
      {super.message =
          "El número de teléfono no es valido, vuelve a intentarlo"});
}
