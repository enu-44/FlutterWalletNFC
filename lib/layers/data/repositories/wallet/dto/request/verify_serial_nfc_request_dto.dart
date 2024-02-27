import 'package:json_annotation/json_annotation.dart';
part 'verify_serial_nfc_request_dto.g.dart';

@JsonSerializable()
class VerifySerialNfcRequestDto {
  VerifySerialNfcRequestDto(this.serial);
  Map<String, dynamic> toJson() => _$VerifySerialNfcRequestDtoToJson(this);

  final String serial;
}
