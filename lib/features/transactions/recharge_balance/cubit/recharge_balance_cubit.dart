import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/features/transactions/recharge_balance/recharge_balance.dart';
import 'package:pago_facil_app/layers/layers.dart';

class RechargeBalanceCubit extends Cubit<RechargeBalanceState> {
  RechargeBalanceCubit(this._walletRepository)
      : super(RechargeBalanceState.initial());

  final IWalletRepository _walletRepository;

  final formRechargeKey = GlobalKey<FormState>();
  final bankCtrl = TextEditingController();
  final bankAccountTypeCtrl = TextEditingController();
  final amountCtrl = TextEditingController();

  Future<void> onRecharge() async {
    emit(RechargeBalanceState.loading());
    final result = await _walletRepository.recharge(RechargeWalletRequest(
        amount: double.parse(amountCtrl.text),
        bankName: bankCtrl.text,
        bankAccountType: bankAccountTypeCtrl.text));
    result.fold(
      (_) => emit(RechargeBalanceState.failure()),
      (_) => emit(RechargeBalanceState.success()),
    );
  }

  bool isValidForm() => formRechargeKey.currentState!.validate();

  @override
  Future<void> close() {
    bankCtrl.dispose();
    bankAccountTypeCtrl.dispose();
    amountCtrl.dispose();
    return super.close();
  }
}
