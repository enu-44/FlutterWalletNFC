abstract class NfcPairingState {
  NfcPairingState({this.message = ''});
  final String message;
  factory NfcPairingState.initial() => _NfcPairingInitial();
  factory NfcPairingState.loading() => NfcPairingLoading();
  factory NfcPairingState.success() => NfcPairingSuccess();
  factory NfcPairingState.readed() => NfcPairingReaded();
  factory NfcPairingState.failure() => NfcPairingFailure();
}

class _NfcPairingInitial extends NfcPairingState {}

class NfcPairingReaded extends NfcPairingState {}

class NfcPairingLoading extends NfcPairingState {
  NfcPairingLoading({super.message = "Cargando..."});
}

class NfcPairingSuccess extends NfcPairingState {
  NfcPairingSuccess({super.message = "Se realizó el registro correctamente"});
}

class NfcPairingFailure extends NfcPairingState {
  NfcPairingFailure(
      {super.message =
          "Ocurrio un error registrando el dispositivo, reintente de nuevo"});
}
