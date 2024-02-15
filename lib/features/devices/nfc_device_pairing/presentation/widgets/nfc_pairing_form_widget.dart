import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/devices/devices.dart';

class NfcPairingFormWidget extends StatelessWidget {
  const NfcPairingFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NfcDevicesPairingCubit>();
    return Form(
      key: cubit.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(AssetConst.nfc, width: 50, height: 50),
          ),
          _buildDeviceFormField(cubit.deviceController),
          Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: const Text(
                  "Por favor acerque el dispositivo NFC a configurar"))
        ],
      ),
    );
  }

  Widget _buildDeviceFormField(TextEditingController controller) {
    return InputWidget(
      controller: controller,
      hintText: "Dispositivo",
      labelText: "Dispositivo",
      icons: Icons.nfc,
      enabled: false,
      inputType: TextInputType.text,
      validator: (value) => FormValidatorsUtils.validate(
          [(_) => FormValidatorsUtils.requiredField(value)]),
    );
  }
}
