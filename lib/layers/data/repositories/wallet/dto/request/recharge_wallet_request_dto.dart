import 'package:json_annotation/json_annotation.dart';
part 'recharge_wallet_request_dto.g.dart';

@JsonSerializable()
class RechargeWalletRequestDto {
  RechargeWalletRequestDto(
      {required this.amount,
      required this.banckName,
      required this.bankAccountType});
  Map<String, dynamic> toJson() => _$RechargeWalletRequestDtoToJson(this);

  final double amount;
  @JsonKey(name: 'bank')
  final String banckName;
  @JsonKey(name: 'wallet_type')
  final String bankAccountType;
}
