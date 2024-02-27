import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/features/transactions/send_money/send_money.dart';
import 'package:pago_facil_app/features/transactions/shared/shared.dart';

class SendNfcFormWidget extends StatelessWidget {
  const SendNfcFormWidget(
      {super.key, required this.formKey, required this.cubit});

  final Key? formKey;
  final SendMoneyCubit cubit;
  @override
  Widget build(BuildContext context) =>
      SharedNfcSupportWidget(buildContent: () => _buildFormNfc());

  Widget _buildFormNfc() {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          SharedNfcFormWidget(
            walletPhoneController: cubit.walletPhoneCtrl,
            userFullNameController: cubit.walletUserFullNameCtrl,
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
