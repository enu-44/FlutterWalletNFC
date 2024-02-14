import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/features/transactions/send_money/send_money.dart';

class SendMoneyCubit extends Cubit<SendMoneyState> {
  SendMoneyCubit() : super(SendMoneyState.initial());

  final formSendNfcKey = GlobalKey<FormState>();
  final formSendEditAccountKey = GlobalKey<FormState>();

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
