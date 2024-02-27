import 'package:json_annotation/json_annotation.dart';
part 'enroll_nfc_request_dto.g.dart';

@JsonSerializable()
class EnrollNfcRequestDto {
  EnrollNfcRequestDto({required this.serial, required this.isActive});
  Map<String, dynamic> toJson() => _$EnrollNfcRequestDtoToJson(this);
  final String serial;
  @JsonKey(name: 'is_active')
  final bool isActive;
}
