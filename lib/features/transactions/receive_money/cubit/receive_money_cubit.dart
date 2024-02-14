import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/features/transactions/transactions.dart';

class ReceiveMoneyCubit extends Cubit<ReceivedMoneyState> {
  ReceiveMoneyCubit() : super(ReceivedMoneyState.initial());

  final formReceiveKey = GlobalKey<FormState>();
  final accountNumberController = TextEditingController();
  final accountFullNameController = TextEditingController();
  final ammountController = TextEditingController();
  final conceptController = TextEditingController();
  @override
  Future<void> close() {
    accountNumberController.dispose();
    accountFullNameController.dispose();
    ammountController.dispose();
    conceptController.dispose();
    return super.close();
  }
}
