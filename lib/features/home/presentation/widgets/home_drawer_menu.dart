import 'package:flutter/material.dart';
import 'package:pago_facil_app/core/core.dart';

class HomeDrawerMenu extends StatelessWidget {
  const HomeDrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerWidget(
      children: <Widget>[
        const SizedBox(height: 30.0),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text("Configurar NFC"),
          onTap: () => Navigator.pushNamed(context, AppRoutes.nfcDevices),
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text("Cerrar Sesion"),
          onTap: () =>
              Navigator.pushReplacementNamed(context, AppRoutes.splash),
        ),
      ],
    );
  }
}
