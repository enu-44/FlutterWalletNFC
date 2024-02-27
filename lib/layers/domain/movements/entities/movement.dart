import 'package:pago_facil_app/layers/domain/domain.dart';

class Movement {
  final String title;
  final DateTime date;
  final MovementType movementType;
  final String movementTypeName;
  final double amount;
  final String concept;
  final String referencia;

  Movement({
    required this.title,
    required this.date,
    required this.movementType,
    required this.movementTypeName,
    required this.amount,
    required this.concept,
    required this.referencia,
  });
}
