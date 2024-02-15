import 'package:flutter/material.dart';
import 'package:pago_facil_app/core/core.dart';

class NfcDeviceCardWidget extends StatelessWidget {
  const NfcDeviceCardWidget({
    super.key,
    required this.id,
    required this.title,
    required this.enrollmentDate,
    required this.isActive,
  });
  final String id;
  final String title;
  final DateTime enrollmentDate;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      leading: _buildIcon(),
      title: Text(title),
      subtitle: Row(
        children: [
          Expanded(
              child: Text(
                  'Vinculado el ${DateFormatUtils.convertToDateHour(enrollmentDate)}')),
          BadgeWidget(
            color: isActive ? Palette.active : Palette.greyLight,
            value: Icon(
              isActive ? Icons.check : Icons.close,
              size: 6.0,
            ),
            child: Icon(
              isActive ? Icons.phone_android : Icons.mobile_off,
              color: isActive ? Palette.primary : Palette.greyLight,
            ),
          ),
        ],
      ),
      trailing: _buildMenu(),
    );
  }

  Widget _buildMenu() {
    return PopupMenuButton(
        icon: const Icon(Icons.more_vert),
        itemBuilder: (BuildContext context) {
          return [
            if (!isActive)
              PopupMenuItem(
                child: const Text('Activar'),
                onTap: () {},
              ),
            if (isActive)
              PopupMenuItem(
                child: const Text('Inactivar'),
                onTap: () {},
              ),
            PopupMenuItem(
              child: const Text('Eliminar'),
              onTap: () {},
            ),
          ];
        });
  }

  Widget _buildIcon() {
    return Icon(
      Icons.nfc,
      color: isActive ? Palette.primary : Palette.greyDark,
      size: 30.0,
    );
  }
}
