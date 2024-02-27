import 'package:flutter/material.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/layers/layers.dart';

class MovementCardWidget extends StatelessWidget {
  const MovementCardWidget({super.key, required this.movement});

  final Movement movement;
  @override
  Widget build(BuildContext context) {
    return ExpandCardWidget(
      leading: _buildIconMovement(),
      title: Row(
        children: [
          Expanded(child: Text(movement.title)),
          Text(
            DateFormatUtils.convertToTimeLine(movement.date),
            style: const TextStyle(fontSize: 12.0),
          ),
        ],
      ),
      subtitle: Row(
        children: [
          Expanded(child: Text(movement.movementTypeName)),
          Text(
            MoneyFormatUtils.getMoneyFormat(value: movement.amount),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: _buildColorMovement()),
          ),
        ],
      ),
      childExpand: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle("Concepto"),
          Text(movement.concept),
          _buildTitle("Fecha"),
          Text(DateFormatUtils.convertToDateHour(movement.date)),
          _buildTitle("Referencia"),
          Text(movement.referencia)
        ],
      ),
    );
  }

  Widget _buildTitle(String label) => Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold),
      );

  Widget _buildIconMovement() {
    final icon = <MovementType, Widget>{
      MovementType.sending: _buildIcon(Icons.arrow_downward),
      MovementType.reception: _buildIcon(Icons.arrow_upward),
      MovementType.recharge: _buildIcon(Icons.arrow_upward)
    };
    return icon[movement.movementType] ?? const Icon(Icons.circle);
  }

  Color _buildColorMovement() {
    final color = <MovementType, Color>{
      MovementType.sending: Palette.red,
      MovementType.reception: Palette.primary,
      MovementType.recharge: Palette.green
    };
    return color[movement.movementType] ?? Palette.primary;
  }

  Widget _buildIcon(IconData icon) => Icon(
        icon,
        color: _buildColorMovement(),
        size: 30.0,
      );
}
