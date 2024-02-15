abstract class NfcDevicePairingState {
  NfcDevicePairingState();
  factory NfcDevicePairingState.initial() => _NfcDevicePairingInitial();
  factory NfcDevicePairingState.loading() => NfcDevicePairingLoading();
  factory NfcDevicePairingState.success() => NfcDevicePairingSuccess();
  factory NfcDevicePairingState.failure() => NfcDevicePairingFailure();
}

class _NfcDevicePairingInitial extends NfcDevicePairingState {}

class NfcDevicePairingLoading extends NfcDevicePairingState {}

class NfcDevicePairingSuccess extends NfcDevicePairingState {}

class NfcDevicePairingFailure extends NfcDevicePairingState {}
