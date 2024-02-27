import 'package:flutter/material.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/features.dart';

class HomeDrawerMenu extends StatelessWidget {
  const HomeDrawerMenu({super.key, required this.cubit});
  final HomeCubit cubit;

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
            title: const Text("Cerrar sesión"),
            onTap: () => _confirmAlertSignOut(context, cubit)),
      ],
    );
  }

  Future<void> _confirmAlertSignOut(
      BuildContext context, HomeCubit cubit) async {
    final result = await CustomDialog.confirm(context,
        message: "¿Esta seguro que desea cerrar sesión?");
    if (!result) return;
    cubit.signOut().then((value) => Navigator.pushNamedAndRemoveUntil(
        context, AppRoutes.splash, (_) => false));
  }
}
