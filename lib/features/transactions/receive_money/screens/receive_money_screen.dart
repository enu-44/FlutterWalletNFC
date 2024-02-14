import 'package:flutter/material.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/transactions/shared/shared.dart';

class ReceiveMoneyScreen extends StatelessWidget {
  const ReceiveMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(
        context: context,
        labelTitle: "Recibe Plata ",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              EnterAccountFormWidget(
                onValidate: () {},
                accountNumberController: TextEditingController(),
                userFullNameController:
                    TextEditingController(text: "Enuar Munoz Castillo"),
              ),
              NfcFormWidget(
                accountNumberController:
                    TextEditingController(text: "12*******2334"),
                userFullNameController:
                    TextEditingController(text: "Enuar Munoz Castillo"),
              ),
              const SizedBox(height: 10.0),
              TransactionFormWidget(
                amountController: TextEditingController(),
                conceptController: TextEditingController(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
