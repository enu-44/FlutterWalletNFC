import 'package:flutter/material.dart';
import 'package:pago_facil_app/features/transactions/transactions.dart';

class AmountFormWidget extends StatelessWidget {
  const AmountFormWidget(
      {super.key, required this.cubit, this.enabledInputs = true});
  final ReceiveMoneyCubit cubit;
  final bool enabledInputs;

  @override
  Widget build(BuildContext context) => Form(
        key: cubit.formReceiveAmountKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SharedTransactionFormWidget(
          amountController: cubit.amountCtrl,
          conceptController: cubit.conceptCtrl,
          enabledInputs: enabledInputs,
        ),
      );
}
