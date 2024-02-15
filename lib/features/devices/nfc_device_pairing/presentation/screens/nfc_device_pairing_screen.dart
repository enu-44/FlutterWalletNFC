import 'package:flutter/material.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/devices/devices.dart';

class NfcDevicePairingScreen extends StatelessWidget {
  const NfcDevicePairingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(
        context: context,
        labelTitle: "Configurar NFC",
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: NfcPairingFormWidget(),
      ),
      bottomNavigationBar: SizedBox(
        height: kBottomNavigationBarHeight,
        child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: ButtonWidget(
              text: "Guardar",
              icon: Icons.arrow_circle_right,
              onTap: () => {},
            )),
      ),
    );
  }
}
