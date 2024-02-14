import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/transactions/receive_money/receive_money.dart';
import 'package:pago_facil_app/features/transactions/shared/shared.dart';

class ReceiveMoneyScreen extends StatelessWidget {
  const ReceiveMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ReceiveMoneyCubit>();
    return Scaffold(
      appBar: DefaultAppBarWidget(
        context: context,
        labelTitle: "Recibe Plata ",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: _builFormWidget(cubit),
        ),
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

  Widget _builFormWidget(ReceiveMoneyCubit cubit) {
    return Form(
      key: cubit.formReceiveKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TransactionFormWidget(
            amountController: cubit.ammountController,
            conceptController: cubit.conceptController,
          ),
        ],
      ),
    );
  }
}
