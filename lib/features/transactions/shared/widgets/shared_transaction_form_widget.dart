import 'package:flutter/material.dart';
import 'package:pago_facil_app/core/core.dart';

class SharedTransactionFormWidget extends StatelessWidget {
  const SharedTransactionFormWidget(
      {super.key,
      this.enabledInputs = true,
      required this.amountController,
      required this.conceptController});

  final TextEditingController amountController;
  final TextEditingController conceptController;
  final bool enabledInputs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildAmountFormField(amountController),
        const SizedBox(height: 10.0),
        _buildConceptFormField(conceptController),
      ],
    );
  }

  Widget _buildConceptFormField(TextEditingController controller) {
    return TextareaWidget(
      controller: controller,
      hintText: "Diligencie el concepto",
      labelText: "Concepto",
      enabled: enabledInputs,
      icons: Icons.description,
      inputType: TextInputType.text,
      validator: (value) => FormValidatorsUtils.validate([
        (_) => FormValidatorsUtils.requiredField(value),
        (_) => FormValidatorsUtils.maxLength(value, 400),
      ]),
    );
  }

  Widget _buildAmountFormField(TextEditingController controller) {
    return InputWidget(
      controller: controller,
      hintText: "Ingrese el valor",
      labelText: "¿ Cuánto ?",
      icons: Icons.monetization_on,
      inputType: TextInputType.number,
      enabled: enabledInputs,
      validator: (value) => FormValidatorsUtils.validate([
        (_) => FormValidatorsUtils.requiredField(value),
        (_) => FormValidatorsUtils.maxLength(value, 20),
        (_) => FormValidatorsUtils.numericOrDecimalsOnly(value)
      ]),
    );
  }
}
