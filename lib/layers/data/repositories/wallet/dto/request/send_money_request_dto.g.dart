// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_money_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendMoneyRequestDto _$SendMoneyRequestDtoFromJson(Map<String, dynamic> json) =>
    SendMoneyRequestDto(
      amount: (json['amount'] as num).toDouble(),
      destinationWalletId: json['account_destination'] as String,
      concept: json['concept'] as String,
    );

Map<String, dynamic> _$SendMoneyRequestDtoToJson(
        SendMoneyRequestDto instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'account_destination': instance.destinationWalletId,
      'concept': instance.concept,
    };
