// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enroll_nfc_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnrollNfcRequestDto _$EnrollNfcRequestDtoFromJson(Map<String, dynamic> json) =>
    EnrollNfcRequestDto(
      serial: json['serial'] as String,
      isActive: json['is_active'] as bool,
    );

Map<String, dynamic> _$EnrollNfcRequestDtoToJson(
        EnrollNfcRequestDto instance) =>
    <String, dynamic>{
      'serial': instance.serial,
      'is_active': instance.isActive,
    };
