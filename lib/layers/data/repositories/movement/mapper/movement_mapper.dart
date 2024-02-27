import 'package:pago_facil_app/layers/layers.dart';

extension MovementMapper on MovementResponseDto {
  static final Map<String, MovementType> _format = <String, MovementType>{
    'reception_of_money': MovementType.reception,
    'recharge': MovementType.recharge,
    'shipment_completed': MovementType.sending
  };

  MovementType get _movementType =>
      _format[typeMovementCode] ?? MovementType.reception;

  String _validateTitle() {
    final format = <MovementType, String>{
      MovementType.reception: sender,
      MovementType.recharge: typeMovement,
      MovementType.sending: destinatation ?? ''
    };
    return format[_movementType] ?? '';
  }

  Movement toDom() => Movement(
      amount: amount,
      concept: concept ?? '',
      date: movementDate ?? DateTime.now(),
      referencia: referencia ?? '',
      movementType: _movementType,
      movementTypeName: typeMovement,
      title: _validateTitle());
}
