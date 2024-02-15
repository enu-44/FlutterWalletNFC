abstract class ReceivedMoneyState {
  ReceivedMoneyState({this.message = ''});
  final String message;

  factory ReceivedMoneyState.initial() => ReceivedMoneyInitial();
  factory ReceivedMoneyState.toReadNfc() => ReceivedMoneyToReadNfc();
  factory ReceivedMoneyState.validatingNfc() => ReceivedMoneyValidatingNfc();
  factory ReceivedMoneyState.successNfc() => ReceivedMoneySuccessNfc();
  factory ReceivedMoneyState.errorNfc() => ReceivedMoneyErrorNfc();
  factory ReceivedMoneyState.loading() => ReceivedMoneyLoading();
  factory ReceivedMoneyState.success() => ReceivedMoneySuccess();
  factory ReceivedMoneyState.failure() => ReceivedMoneyFailure();
}

class ReceivedMoneyInitial extends ReceivedMoneyState {}

class ReceivedMoneyToReadNfc extends ReceivedMoneyState {}

class ReceivedMoneyValidatingNfc extends ReceivedMoneyState {
  ReceivedMoneyValidatingNfc({super.message = "Validando NFC..."});
}

class ReceivedMoneySuccessNfc extends ReceivedMoneyState {}

class ReceivedMoneyErrorNfc extends ReceivedMoneyState {
  ReceivedMoneyErrorNfc(
      {super.message =
          "El dispositivo NFC, no se encuentra activo o no esta adminitido..."});
}

class ReceivedMoneyLoading extends ReceivedMoneyState {
  ReceivedMoneyLoading({super.message = "Procesando..."});
}

class ReceivedMoneySuccess extends ReceivedMoneyState {
  ReceivedMoneySuccess({super.message = "Se realizo la recarga correctamente"});
}

class ReceivedMoneyFailure extends ReceivedMoneyState {
  ReceivedMoneyFailure(
      {super.message =
          "Ocurrio un error en la transaccion, reintente de nuevo"});
}
