import 'package:json_annotation/json_annotation.dart';
part 'wallet_validation_response_dto.g.dart';

@JsonSerializable(createToJson: false)
class WalletValidationResponseDto {
  WalletValidationResponseDto(
      {required this.walletId, required this.phone, required this.user});
  factory WalletValidationResponseDto.fromJson(Map<String, dynamic> json) =>
      _$WalletValidationResponseDtoFromJson(json);

  @JsonKey(name: 'wallet_id')
  final String walletId;
  final String phone;
  final String user;
}
