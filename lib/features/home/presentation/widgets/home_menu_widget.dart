import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:pago_facil_app/core/core.dart';

class HomeMenuWidget extends StatelessWidget {
  const HomeMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingButtonWidget.animated(children: [
      SpeedDialChild(
        child: const Icon(Icons.arrow_upward),
        label: 'Recarga',
        onTap: () => Navigator.pushNamed(context, AppRoutes.rechargeBalance),
      ),
      SpeedDialChild(
        child: const Icon(Icons.arrow_downward),
        label: 'Recibe',
        onTap: () => Navigator.pushNamed(context, AppRoutes.receivedMoney),
      ),
      SpeedDialChild(
        child: const Icon(Icons.arrow_right_alt),
        label: 'Envia',
        onTap: () => Navigator.pushNamed(context, AppRoutes.sendMoney),
      ),
    ]);
  }
}
