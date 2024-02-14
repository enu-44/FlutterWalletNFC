import 'package:flutter/material.dart';
import 'package:pago_facil_app/core/core.dart';

class CommonFormWidget extends StatelessWidget {
  const CommonFormWidget(
      {super.key,
      required this.accountNumberController,
      required this.userFullNameController,
      this.enabledAccountNumber = false,
      this.showBtnValidate = false,
      this.onTapBtnValidate});

  final TextEditingController accountNumberController;
  final TextEditingController userFullNameController;
  final bool enabledAccountNumber;
  final bool showBtnValidate;
  final void Function()? onTapBtnValidate;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!showBtnValidate)
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(AssetConst.nfc, width: 50, height: 50),
          ),
        if (showBtnValidate) const SizedBox(height: 10.0),
        if (showBtnValidate)
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildAccountFormField(accountNumberController),
              ),
              Expanded(
                child: ButtonWidget(
                  text: 'Validar',
                  onTap: onTapBtnValidate,
                ),
              )
            ],
          )
        else
          _buildAccountFormField(accountNumberController),
        const SizedBox(height: 10.0),
        _buildFullNameFormField(userFullNameController),
        if (!enabledAccountNumber)
          Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: const Text("Por favor acerque el dispositivo NFC a leer")),
      ],
    );
  }

  Widget _buildAccountFormField(TextEditingController controller) {
    return InputWidget(
      controller: controller,
      hintText: "Numero de la cuenta",
      labelText: "Cuenta",
      icons: Icons.numbers,
      inputType: TextInputType.number,
      enabled: enabledAccountNumber,
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
