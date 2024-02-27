import 'package:flutter/material.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/features.dart';
import 'package:pago_facil_app/layers/layers.dart';

class NfcDeviceCardWidget extends StatelessWidget {
  const NfcDeviceCardWidget(
      {super.key, required this.nfc, required this.cubit});
  final Nfc nfc;
  final NfcDevicesCubit cubit;

  @override
  Widget build(BuildContext context) {
    return CardWidget(
      leading: _buildIcon(),
      title: Row(
        children: [
          Expanded(child: Text('#Nfc ${nfc.serial}')),
          Text(
            DateFormatUtils.convertToTimeLine(nfc.enrollmentDate),
            style: const TextStyle(fontSize: 10.0),
          ),
        ],
      ),
      subtitle: Row(
        children: [
          Expanded(
              child: Text(
                  'Vinculado el ${DateFormatUtils.convertToDateHour(nfc.enrollmentDate)}')),
          BadgeWidget(
            color: nfc.isActive ? Palette.green : Palette.greyLight,
            value: Icon(
              nfc.isActive ? Icons.check : Icons.close,
              size: 6.0,
              color: Palette.white,
            ),
            child: Icon(
              nfc.isActive ? Icons.phone_android : Icons.mobile_off,
              color: nfc.isActive ? Palette.primary : Palette.greyLight,
            ),
          ),
        ],
      ),
      trailing: _buildMenu(),
    );
  }

  Widget _buildMenu() => PopupMenuButton(
        icon: const Icon(Icons.more_vert),
        itemBuilder: (BuildContext context) {
          return [
            if (!nfc.isActive)
              PopupMenuItem(
                child: const Text('Activar'),
                onTap: () => cubit.onChangeStatus(nfc.nfcId, true),
              ),
            if (nfc.isActive)
              PopupMenuItem(
                child: const Text('Inactivar'),
                onTap: () => cubit.onChangeStatus(nfc.nfcId, false),
              ),
            PopupMenuItem(
              child: const Text('Eliminar'),
              onTap: () => cubit.onDelete(nfc.nfcId),
            ),
          ];
        },
      );

  Widget _buildIcon() => Icon(
        Icons.nfc,
        color: nfc.isActive ? Palette.primary : Palette.greyDark,
        size: 30.0,
      );
}
