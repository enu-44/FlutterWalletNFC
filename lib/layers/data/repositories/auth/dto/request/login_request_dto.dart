import 'package:json_annotation/json_annotation.dart';
part 'login_request_dto.g.dart';

@JsonSerializable()
class LoginRequestDto {
  LoginRequestDto({required this.phone, required this.password});
  Map<String, dynamic> toJson() => _$LoginRequestDtoToJson(this);

  final String phone;
  final String password;
}
