import 'package:json_annotation/json_annotation.dart';
import 'package:pago_facil_app/core/core.dart';
part 'nfc_response_dto.g.dart';

@JsonSerializable(createToJson: false)
class NfcResponseDto {
  NfcResponseDto(
      {required this.nfcId,
      required this.serial,
      required this.isActive,
      this.enrollmentDate});

  factory NfcResponseDto.fromJson(Map<String, dynamic> json) =>
      _$NfcResponseDtoFromJson(json);

  @JsonKey(name: 'id')
  final String nfcId;
  final String serial;
  @JsonKey(name: 'vinculate_date', fromJson: DateFormatUtils.fromJsonDateTime)
  final DateTime? enrollmentDate;
  @JsonKey(name: 'is_active')
  final bool isActive;

  static List<NfcResponseDto> fromListJson(List<dynamic>? json) {
    final List<NfcResponseDto> list =
        json!.map((dynamic e) => NfcResponseDto.fromJson(e)).toList();
    return list;
  }
}
