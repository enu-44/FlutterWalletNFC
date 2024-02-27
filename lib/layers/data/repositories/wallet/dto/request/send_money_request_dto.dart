import 'package:json_annotation/json_annotation.dart';
part 'send_money_request_dto.g.dart';

@JsonSerializable()
class SendMoneyRequestDto {
  SendMoneyRequestDto(
      {required this.amount,
      required this.destinationWalletId,
      required this.concept});
  Map<String, dynamic> toJson() => _$SendMoneyRequestDtoToJson(this);

  final double amount;
  @JsonKey(name: 'account_destination')
  final String destinationWalletId;
  final String concept;
}
