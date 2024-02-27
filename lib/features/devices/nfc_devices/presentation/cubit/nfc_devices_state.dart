import 'package:pago_facil_app/layers/layers.dart';

abstract class NfcDevicesState {
  final List<Nfc> devices;
  NfcDevicesState({this.devices = const []});

  factory NfcDevicesState.initial() => NfcDevicesInitial();
  factory NfcDevicesState.success(List<Nfc> devices) =>
      devices.isEmpty ? NfcDevicesEmpty() : NfcDevicesSuccess(devices: devices);
  factory NfcDevicesState.failure() => NfcDevicesFailure();
  factory NfcDevicesState.loading() => NfcDevicesLoading();
  failureStatus() => NfcDeviceStatusFailure(devices: devices);
  failureDelete() => NfcDeviceDeleteFailure(devices: devices);
}

class NfcDevicesInitial extends NfcDevicesState {}

class NfcDevicesSuccess extends NfcDevicesState {
  NfcDevicesSuccess({super.devices});
}

class NfcDevicesEmpty extends NfcDevicesState {}

class NfcDeviceStatusFailure extends NfcDevicesState {
  NfcDeviceStatusFailure({super.devices});
}

class NfcDeviceDeleteFailure extends NfcDevicesState {
  NfcDeviceDeleteFailure({super.devices});
}

class NfcDevicesFailure extends NfcDevicesState {}

class NfcDevicesLoading extends NfcDevicesState {}
