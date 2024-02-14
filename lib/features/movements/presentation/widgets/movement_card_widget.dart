import 'package:flutter/material.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/movements/movements.dart';

class MovementCardWidget extends StatelessWidget {
  const MovementCardWidget(
      {super.key,
      required this.title,
      required this.movementDate,
      required this.movementType,
      required this.amount,
      required this.concept,
      required this.referencia});

  final String title;
  final DateTime movementDate;
  final MovementType movementType;
  final double amount;
  final String concept;
  final String referencia;

  @override
  Widget build(BuildContext context) {
    return ExpandCardWidget(
      leading: _buildIcon(),
      title: Row(
        children: [
          Expanded(child: Text(title)),
          Text(
            CapitalizeUtils.capitalize(
                DateFormatUtils.convertToTimeLine(movementDate)),
            style: const TextStyle(fontSize: 12.0),
          ),
        ],
      ),
      subtitle: Row(
        children: [
          Expanded(child: Text(movementType.value)),
          Text(
            MoneyFormatUtils.getMoneyFormat(value: amount),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: _buildTextColor()),
          ),
        ],
      ),
      childExpand: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Concepto",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(concept),
          const Text(
            "Fecha",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(DateFormatUtils.convertToDateHour(movementDate)),
          const Text(
            "Referencia",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(referencia)
        ],
      ),
    );
  }

  Color _buildTextColor() {
    final color = <MovementType, Color>{
      MovementType.envio: Palette.red,
      MovementType.recepcion: Palette.primary,
      MovementType.recarga: Palette.primary
    };
    return color[movementType] ?? Palette.primary;
  }

  Widget _buildIcon() {
    final icon = <MovementType, Widget>{
      MovementType.envio: const Icon(
        Icons.arrow_downward,
        color: Palette.red,
        size: 30.0,
      ),
      MovementType.recepcion: const Icon(
        Icons.arrow_upward,
        color: Palette.primary,
        size: 30.0,
      ),
      MovementType.recarga: const Icon(
        Icons.arrow_upward,
        color: Palette.primary,
        size: 30.0,
      )
    };
    return icon[movementType] ?? const Icon(Icons.circle);
  }
}
