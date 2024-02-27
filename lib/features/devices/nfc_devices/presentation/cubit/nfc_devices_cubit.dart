import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/features/devices/nfc_devices/nfc_devices.dart';
import 'package:pago_facil_app/layers/layers.dart';

class NfcDevicesCubit extends Cubit<NfcDevicesState> {
  NfcDevicesCubit(this._nfcRepository) : super(NfcDevicesState.initial());
  final INfcRepository _nfcRepository;

  Future<void> load() async {
    emit(NfcDevicesState.loading());
    final result = await _nfcRepository.list();
    result.fold(
      (_) => emit(NfcDevicesState.failure()),
      (_) => emit(NfcDevicesState.success(_)),
    );
  }

  Future<void> onChangeStatus(String nfcId, bool isActive) async {
    emit(NfcDevicesState.loading());
    final result = await _nfcRepository.changeStatus(nfcId, isActive);
    result.fold(
      (_) => emit(state.failureStatus()),
      (_) => load(),
    );
  }

  Future<void> onDelete(String nfcId) async {
    emit(NfcDevicesState.loading());
    final result = await _nfcRepository.delete(nfcId);
    result.fold(
      (_) => emit(state.failureDelete()),
      (_) => load(),
    );
  }
}
