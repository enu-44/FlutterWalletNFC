abstract class SendMoneyState {
  SendMoneyState({this.message = ''});
  final String message;
  factory SendMoneyState.initial() => _SendMoneyInitial();
  factory SendMoneyState.loading() => SendMoneyLoading();
  factory SendMoneyState.success() => SendMoneySuccess();
  factory SendMoneyState.walletValid() => SendMoneyWalletValid();
  factory SendMoneyState.walletPhoneInvalid() => SendMoneyWalletInvalid(
      message: "El número de teléfono, no corresponde a una cuenta valida.");
  factory SendMoneyState.walletNfcInvalid() => SendMoneyWalletInvalid(
      message:
          "El dispositivo NFC, no se encuentra activo o no esta admitido.");
  factory SendMoneyState.failure() => SendMoneyFailure();
}

class _SendMoneyInitial extends SendMoneyState {}

class SendMoneyWalletValid extends SendMoneyState {}

class SendMoneyWalletInvalid extends SendMoneyState {
  SendMoneyWalletInvalid({super.message});
}

class SendMoneyLoading extends SendMoneyState {
  SendMoneyLoading({super.message = "Cargando..."});
}

class SendMoneySuccess extends SendMoneyState {
  SendMoneySuccess({super.message = "Se realizó el envío correctamente"});
}

class SendMoneyFailure extends SendMoneyState {
  SendMoneyFailure(
      {super.message =
          "Ocurrio un error en la transacción, reintente de nuevo"});
}
