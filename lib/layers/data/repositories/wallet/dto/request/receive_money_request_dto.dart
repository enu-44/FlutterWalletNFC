import 'package:json_annotation/json_annotation.dart';
part 'receive_money_request_dto.g.dart';

@JsonSerializable()
class ReceiveMoneyRequestDto {
  ReceiveMoneyRequestDto(
      {required this.amount,
      required this.billingWalletId,
      required this.concept});
  Map<String, dynamic> toJson() => _$ReceiveMoneyRequestDtoToJson(this);

  final double amount;
  final String concept;
  @JsonKey(name: 'account_sender')
  final String billingWalletId;
}
