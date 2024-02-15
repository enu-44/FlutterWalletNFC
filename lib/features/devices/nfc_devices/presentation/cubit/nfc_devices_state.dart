abstract class NfcDevicesState {
  NfcDevicesState();
  factory NfcDevicesState.initial() => NfcDevicesInitial();
  factory NfcDevicesState.success(List<dynamic> devices) =>
      NfcDevicesSuccess(devices);
  factory NfcDevicesState.failure() => NfcDevicesFailure();
  factory NfcDevicesState.loading() => NfcDevicesLoading();
}

class NfcDevicesInitial extends NfcDevicesState {}

class NfcDevicesSuccess extends NfcDevicesState {
  final List<dynamic> devices;
  NfcDevicesSuccess(this.devices) : super();
}

class NfcDevicesEmpty extends NfcDevicesState {}

class NfcDevicesFailure extends NfcDevicesState {}

class NfcDevicesLoading extends NfcDevicesState {}
