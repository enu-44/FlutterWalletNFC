import 'package:json_annotation/json_annotation.dart';
part 'nfc_status_request_dto.g.dart';

@JsonSerializable()
class NfcStatusRequestDto {
  NfcStatusRequestDto({required this.isActive});
  Map<String, dynamic> toJson() => _$NfcStatusRequestDtoToJson(this);

  @JsonKey(name: 'is_active')
  final bool isActive;
}
