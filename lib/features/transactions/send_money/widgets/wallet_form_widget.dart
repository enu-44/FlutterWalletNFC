import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/features/transactions/send_money/send_money.dart';
import 'package:pago_facil_app/features/transactions/shared/shared.dart';

class WalletFormWidget extends StatelessWidget {
  const WalletFormWidget(
      {super.key, required this.formKey, required this.cubit, this.onValidate});

  final Key? formKey;
  final SendMoneyCubit cubit;
  final void Function()? onValidate;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          SharedWalletFormWidget(
            onValidate: onValidate,
            walletNumberController: cubit.walletPhoneCtrl,
            walletUserFullNameController: cubit.walletUserFullNameCtrl,
          ),
          const SizedBox(height: 20.0),
          SharedTransactionFormWidget(
            amountController: cubit.amountCtrl,
            conceptController: cubit.conceptCtrl,
          ),
          const SizedBox(height: 10.0),
          BlocBuilder<SendMoneyCubit, SendMoneyState>(
            builder: (BuildContext _, SendMoneyState state) {
              if (state is SendMoneyLoading) {
                return const CircularProgressIndicator();
              }
              return const SizedBox.shrink();
            },
          )
        ],
      ),
    );
  }
}
