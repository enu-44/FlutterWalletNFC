import 'package:flutter/material.dart';
import 'package:pago_facil_app/features/transactions/transactions.dart';

class ReceiveNfcFormWidget extends StatelessWidget {
  const ReceiveNfcFormWidget({super.key, required this.cubit});
  final ReceiveMoneyCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formReceiveNfcKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: SharedNfcFormWidget(
        walletPhoneController: cubit.phoneCtrl,
        userFullNameController: cubit.fullNameCtrl,
      ),
    );
  }
}
