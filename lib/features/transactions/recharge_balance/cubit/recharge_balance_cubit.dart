import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/features/transactions/recharge_balance/recharge_balance.dart';

class RechargeBalanceCubit extends Cubit<RechargeBalanceState> {
  RechargeBalanceCubit() : super(RechargeBalanceState.initial());

  final formRechargeKey = GlobalKey<FormState>();
  final bankController = TextEditingController();
  final bankAccountTypeController = TextEditingController();
  final ammountController = TextEditingController();
  @override
  Future<void> close() {
    bankController.dispose();
    bankAccountTypeController.dispose();
    ammountController.dispose();
    return super.close();
  }
}

List<String> banks = ["Bancolombia", "Banco Occidente", "Banco Popular"];

List<String> banksAccountType = ["Ahorro", "Corriente"];
