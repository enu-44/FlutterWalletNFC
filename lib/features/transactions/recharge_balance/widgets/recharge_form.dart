import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/transactions/recharge_balance/cubit/recharge_balance_cubit.dart';

class RechargeFormWidget extends StatelessWidget {
  const RechargeFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RechargeBalanceCubit>();
    return Form(
      key: cubit.formRechargeKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          const SizedBox(height: 15.0),
          _buildBanksFormField(cubit.bankController),
          const SizedBox(height: 15.0),
          _buildBankAccountTypeFormField(cubit.bankAccountTypeController),
          const SizedBox(height: 15.0),
          _buildAmountFormField(cubit.ammountController),
        ],
      ),
    );
  }

  Widget _buildBankAccountTypeFormField(TextEditingController controller) {
    return DropdownWidget<String>(
        labelText: "Tipo de cuenta",
        hintText: "Seleccione una opcion",
        items: banksAccountType,
        controller: controller,
        displayText: (item) => item);
  }

  Widget _buildBanksFormField(TextEditingController controller) {
    return DropdownWidget<String>(
        labelText: "Banco",
        hintText: "Seleccione una opcion",
        items: banks,
        controller: controller,
        displayText: (item) => item);
  }

  Widget _buildAmountFormField(TextEditingController controller) {
    return InputWidget(
      controller: controller,
      hintText: "Ingrese el valor",
      labelText: "¿ Cuánto ?",
      icons: Icons.monetization_on,
      inputType: TextInputType.number,
      validator: (value) => FormValidatorsUtils.validate([
        (_) => FormValidatorsUtils.requiredField(value),
        (_) => FormValidatorsUtils.maxLength(value, 20),
        (_) => FormValidatorsUtils.numericOrDecimalsOnly(value)
      ]),
    );
  }
}
