import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/features/devices/nfc_devices/nfc_devices.dart';

class NfcDevicesCubit extends Cubit<NfcDevicesState> {
  NfcDevicesCubit() : super(NfcDevicesState.initial());

  Future<void> load() async {
    emit(NfcDevicesState.success(
        ["", "", "", "", "", "", "", "", "", "", "", ""]));
  }
}
