import 'package:flutter/material.dart';
import 'package:pago_facil_app/core/core.dart';

class SharedWalletFormWidget extends StatelessWidget {
  const SharedWalletFormWidget(
      {super.key,
      required this.walletNumberController,
      required this.walletUserFullNameController,
      this.onValidate});

  final TextEditingController walletNumberController;
  final TextEditingController walletUserFullNameController;
  final void Function()? onValidate;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10.0),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: _buildAccountFormField(walletNumberController),
            ),
            Expanded(
              child: ButtonWidget(
                text: 'Validar',
                onTap: onValidate,
              ),
            )
          ],
        ),
        const SizedBox(height: 10.0),
        _buildFullNameFormField(walletUserFullNameController),
      ],
    );
  }

  Widget _buildAccountFormField(TextEditingController controller) {
    return InputWidget(
      controller: controller,
      hintText: "Número de Teléfono",
      labelText: "Teléfono",
      icons: Icons.numbers,
      inputType: TextInputType.number,
      validator: (value) => FormValidatorsUtils.validate([
        (_) => FormValidatorsUtils.requiredField(value),
        (_) => FormValidatorsUtils.maxLength(value, 20),
      ]),
    );
  }

  Widget _buildFullNameFormField(TextEditingController controller) {
    return InputWidget(
      controller: controller,
      hintText: "Usuario",
      labelText: "",
      enabled: false,
      icons: Icons.person,
      inputType: TextInputType.number,
      validator: (value) => FormValidatorsUtils.validate([
        (_) => FormValidatorsUtils.requiredField(value),
      ]),
    );
  }
}
