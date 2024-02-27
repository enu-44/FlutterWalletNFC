// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_account_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAccountRequestDto _$CreateAccountRequestDtoFromJson(
        Map<String, dynamic> json) =>
    CreateAccountRequestDto(
      fullName: json['full_name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      identification: json['identification'] as String,
      identificationType: json['identification_type'] as String? ?? '',
      password: json['password'] as String,
    );

Map<String, dynamic> _$CreateAccountRequestDtoToJson(
        CreateAccountRequestDto instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'phone': instance.phone,
      'email': instance.email,
      'identification': instance.identification,
      'identification_type': instance.identificationType,
      'password': instance.password,
    };
