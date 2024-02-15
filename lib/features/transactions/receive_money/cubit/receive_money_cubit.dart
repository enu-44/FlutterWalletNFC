import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/features/transactions/transactions.dart';

class ReceiveMoneyCubit extends Cubit<ReceivedMoneyState> {
  ReceiveMoneyCubit() : super(ReceivedMoneyState.initial());

  final formReceiveAmountKey = GlobalKey<FormState>();
  final formReceiveNfcKey = GlobalKey<FormState>();

  final accountNumberController = TextEditingController();
  final accountFullNameController = TextEditingController();
  final ammountController = TextEditingController();
  final conceptController = TextEditingController();
  final nfcCodeController = TextEditingController();

  Future<void> validateNfc() async {
    emit(ReceivedMoneyState.validatingNfc());
    await _pause();
    accountNumberController.text = "12*******4545";
    accountFullNameController.text = "Enuar Munoz Castillo";
    emit(ReceivedMoneyState.successNfc());
  }

  Future<void> sendTransaction() async {
    emit(ReceivedMoneyState.loading());
    await _pause();
    emit(ReceivedMoneyState.failure());
  }

  void goReadToNfc() => emit(ReceivedMoneyState.toReadNfc());

  void emitState(ReceivedMoneyState _) => emit(_);

  Future<void> _pause() async {
    await Future.delayed(Duration(seconds: 5)); // Pausa durante 2 segundos
  }

  @override
  Future<void> close() {
    accountNumberController.dispose();
    accountFullNameController.dispose();
    ammountController.dispose();
    conceptController.dispose();
    return super.close();
  }
}
