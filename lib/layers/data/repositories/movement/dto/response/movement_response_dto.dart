import 'package:json_annotation/json_annotation.dart';
import 'package:pago_facil_app/core/core.dart';
part 'movement_response_dto.g.dart';

@JsonSerializable(createToJson: false)
class MovementResponseDto {
  MovementResponseDto({
    required this.id,
    required this.amount,
    required this.sender,
    required this.typeMovement,
    required this.typeMovementCode,
    this.movementDate,
    this.destinatation,
    this.concept,
    this.referencia,
    this.accountDestination,
  });

  factory MovementResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MovementResponseDtoFromJson(json);

  final String id;
  final double amount;

  final String sender;
  @JsonKey(name: 'type_movement')
  final String typeMovement;
  @JsonKey(name: 'type_movement_code')
  final String typeMovementCode;

  final String? destinatation;
  final String? concept;
  final String? referencia;
  @JsonKey(name: 'account_destination')
  final String? accountDestination;

  @JsonKey(name: 'movement_date', fromJson: DateFormatUtils.fromJsonDateTime)
  final DateTime? movementDate;

  static List<MovementResponseDto> fromListJson(List<dynamic>? json) {
    final List<MovementResponseDto> list =
        json!.map((dynamic e) => MovementResponseDto.fromJson(e)).toList();
    return list;
  }
}
