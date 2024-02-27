import 'package:json_annotation/json_annotation.dart';
part 'create_account_request_dto.g.dart';

@JsonSerializable()
class CreateAccountRequestDto {
  CreateAccountRequestDto(
      {required this.fullName,
      required this.phone,
      required this.email,
      required this.identification,
      this.identificationType = '',
      required this.password});
  Map<String, dynamic> toJson() => _$CreateAccountRequestDtoToJson(this);

  @JsonKey(name: 'full_name')
  final String fullName;
  final String phone;
  final String email;
  final String identification;
  @JsonKey(name: 'identification_type')
  final String identificationType;
  final String password;
}
