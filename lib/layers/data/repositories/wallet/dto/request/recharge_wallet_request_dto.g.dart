// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recharge_wallet_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RechargeWalletRequestDto _$RechargeWalletRequestDtoFromJson(
        Map<String, dynamic> json) =>
    RechargeWalletRequestDto(
      amount: (json['amount'] as num).toDouble(),
      banckName: json['bank'] as String,
      bankAccountType: json['wallet_type'] as String,
    );

Map<String, dynamic> _$RechargeWalletRequestDtoToJson(
        RechargeWalletRequestDto instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'bank': instance.banckName,
      'wallet_type': instance.bankAccountType,
    };
