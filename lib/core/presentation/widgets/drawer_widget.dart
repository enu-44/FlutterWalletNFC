import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: const Key('DrawerPage'),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const SizedBox(height: 30.0),
          ListTile(
            leading: const Icon(
              Icons.settings,
            ),
            title: const Text(
              "Configurar NFC",
            ),
            onTap: () => {},
          ),
          ListTile(
              leading: const Icon(
                Icons.logout,
              ),
              title: const Text(
                "Cerrar Sesion",
              ),
              onTap: () => {}),
        ],
      ),
    );
  }
}
