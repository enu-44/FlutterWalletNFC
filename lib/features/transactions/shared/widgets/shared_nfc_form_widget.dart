import 'package:flutter/material.dart';
import 'package:pago_facil_app/core/core.dart';

class SharedNfcFormWidget extends StatelessWidget {
  const SharedNfcFormWidget(
      {super.key,
      required this.walletPhoneController,
      required this.userFullNameController});

  final TextEditingController walletPhoneController;
  final TextEditingController userFullNameController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Image.asset(AssetConst.nfc, width: 50, height: 50),
        ),
        _buildAccountFormField(walletPhoneController),
        const SizedBox(height: 10.0),
        _buildFullNameFormField(userFullNameController),
        Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: const Text("Por favor acerque el dispositivo NFC a leer"))
      ],
    );
  }

  Widget _buildAccountFormField(TextEditingController controller) {
    return InputWidget(
      controller: controller,
      hintText: "Teléfono",
      labelText: "Teléfono",
      icons: Icons.numbers,
      enabled: false,
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
