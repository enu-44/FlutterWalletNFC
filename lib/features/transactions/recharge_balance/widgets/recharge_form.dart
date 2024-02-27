import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/transactions/recharge_balance/recharge_balance.dart';

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
          _buildBanksFormField(cubit.bankCtrl),
          const SizedBox(height: 15.0),
          _buildBankAccountTypeFormField(cubit.bankAccountTypeCtrl),
          const SizedBox(height: 15.0),
          _buildAmountFormField(cubit.amountCtrl),
          const SizedBox(height: 10.0),
          BlocBuilder<RechargeBalanceCubit, RechargeBalanceState>(
            builder: (BuildContext _, RechargeBalanceState state) {
              if (state is RechargeBalanceLoading) {
                return const CircularProgressIndicator();
              }
              return const SizedBox.shrink();
            },
          )
        ],
      ),
    );
  }

  Widget _buildBankAccountTypeFormField(TextEditingController controller) {
    return DropdownWidget<String>(
        labelText: "Tipo de cuenta",
        hintText: "Seleccione una opción",
        items: MasterListConst.banksAccountType,
        controller: controller,
        displayText: (item) => item);
  }

  Widget _buildBanksFormField(TextEditingController controller) {
    return DropdownWidget<String>(
        labelText: "Banco",
        hintText: "Seleccione una opción",
        items: MasterListConst.banks,
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
