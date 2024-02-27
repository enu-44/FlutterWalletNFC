// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movement_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovementResponseDto _$MovementResponseDtoFromJson(Map<String, dynamic> json) =>
    MovementResponseDto(
      id: json['id'] as String,
      amount: (json['amount'] as num).toDouble(),
      sender: json['sender'] as String,
      typeMovement: json['type_movement'] as String,
      typeMovementCode: json['type_movement_code'] as String,
      movementDate:
          DateFormatUtils.fromJsonDateTime(json['movement_date'] as String?),
      destinatation: json['destinatation'] as String?,
      concept: json['concept'] as String?,
      referencia: json['referencia'] as String?,
      accountDestination: json['account_destination'] as String?,
    );
