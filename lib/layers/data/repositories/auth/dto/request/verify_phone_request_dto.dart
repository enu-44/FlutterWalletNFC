import 'package:json_annotation/json_annotation.dart';
part 'verify_phone_request_dto.g.dart';

@JsonSerializable()
class VerifyPhoneRequestDto {
  VerifyPhoneRequestDto(this.phone);
  Map<String, dynamic> toJson() => _$VerifyPhoneRequestDtoToJson(this);

  final String phone;
}
