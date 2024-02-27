abstract class ReceivedMoneyState {
  ReceivedMoneyState({this.message = ''});
  final String message;

  factory ReceivedMoneyState.initial() => ReceivedMoneyInitial();
  factory ReceivedMoneyState.toReadNfc() => ReceivedMoneyToReadNfc();
  factory ReceivedMoneyState.walletValid() => ReceivedMoneyWalletValid();
  factory ReceivedMoneyState.walletInvalid() => ReceivedMoneyWalletInvalid();
  factory ReceivedMoneyState.loading() => ReceivedMoneyLoading();
  factory ReceivedMoneyState.success() => ReceivedMoneySuccess();
  factory ReceivedMoneyState.failure() => ReceivedMoneyFailure();
}

class ReceivedMoneyInitial extends ReceivedMoneyState {}

class ReceivedMoneyToReadNfc extends ReceivedMoneyState {}

class ReceivedMoneyWalletValid extends ReceivedMoneyState {}

class ReceivedMoneyWalletInvalid extends ReceivedMoneyState {
  ReceivedMoneyWalletInvalid(
      {super.message =
          "El dispositivo NFC, no se encuentra activo o no esta admitido..."});
}

class ReceivedMoneyLoading extends ReceivedMoneyState {
  ReceivedMoneyLoading({super.message = "Procesando..."});
}

class ReceivedMoneySuccess extends ReceivedMoneyState {
  ReceivedMoneySuccess({super.message = "Se realizó el pago correctamente"});
}

class ReceivedMoneyFailure extends ReceivedMoneyState {
  ReceivedMoneyFailure(
      {super.message =
          "Ocurrio un error en la transacción, reintente de nuevo"});
}
