import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/devices/devices.dart';
import 'package:pago_facil_app/layers/layers.dart';

class NfcPairingCubit extends Cubit<NfcPairingState> {
  NfcPairingCubit(this._nfcRepository) : super(NfcPairingState.initial());

  final INfcRepository _nfcRepository;

  final formKey = GlobalKey<FormState>();
  final serialNfcCtrl = TextEditingController();
  final ValueNotifier<bool> enabledButton = ValueNotifier<bool>(false);

  Future<void> onValidateSupportNfc() async {
    final isAvailable = await NfcUtils.isAvailable();
    if (!isAvailable) return;
    _startNfc();
  }

  Future<void> onRegisterNfc() async {
    emit(NfcPairingState.loading());
    final result = await _nfcRepository
        .enrollenment(EnrollNfcRequest(serial: serialNfcCtrl.text));
    result.fold(
      (_) => emit(NfcPairingState.failure()),
      (_) => emit(NfcPairingState.success()),
    );
  }

  void _startNfc() => NfcUtils.startSession(onNfc: (String value) {
        serialNfcCtrl.text = value;
        enabledButton.value = true;
      });

  @override
  Future<void> close() {
    serialNfcCtrl.dispose();
    enabledButton.dispose();
    NfcUtils.closeNfc();
    return super.close();
  }
}
