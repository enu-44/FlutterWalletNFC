import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/transactions/send_money/send_money.dart';
import 'package:pago_facil_app/features/transactions/shared/shared.dart';

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SendMoneyCubit>();
    return Scaffold(
      appBar: DefaultAppBarWidget(
        context: context,
        labelTitle: "Envia Plata ",
      ),
      body: TabBarWidget(
        tabTitles: const ["Leer NFC", "Ingresar Cuenta"],
        tabViews: [
          _builFormWidget(cubit.formSendNfcKey, cubit, enabledNfc: true),
          _builFormWidget(cubit.formSendEditAccountKey, cubit,
              enabledNfc: false),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: kBottomNavigationBarHeight,
        child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: ButtonWidget(
              text: "Continuar",
              icon: Icons.arrow_circle_right,
              onTap: () => {},
            )),
      ),
    );
  }

  Widget _builFormWidget(Key? formKey, SendMoneyCubit cubit,
      {required bool enabledNfc}) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          if (enabledNfc)
            NfcFormWidget(
              accountNumberController: cubit.accountNumberController,
              userFullNameController: cubit.accountFullNameController,
            )
          else
            EnterAccountFormWidget(
              onValidate: () {},
              accountNumberController: cubit.accountNumberController,
              userFullNameController: cubit.accountFullNameController,
            ),
          const SizedBox(height: 20.0),
          TransactionFormWidget(
            amountController: cubit.ammountController,
            conceptController: cubit.conceptController,
          ),
        ],
      ),
    );
  }
}
