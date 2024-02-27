// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receive_money_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReceiveMoneyRequestDto _$ReceiveMoneyRequestDtoFromJson(
        Map<String, dynamic> json) =>
    ReceiveMoneyRequestDto(
      amount: (json['amount'] as num).toDouble(),
      billingWalletId: json['account_sender'] as String,
      concept: json['concept'] as String,
    );

Map<String, dynamic> _$ReceiveMoneyRequestDtoToJson(
        ReceiveMoneyRequestDto instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'concept': instance.concept,
      'account_sender': instance.billingWalletId,
    };
