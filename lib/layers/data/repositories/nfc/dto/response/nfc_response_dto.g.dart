// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nfc_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NfcResponseDto _$NfcResponseDtoFromJson(Map<String, dynamic> json) =>
    NfcResponseDto(
      nfcId: json['id'] as String,
      serial: json['serial'] as String,
      isActive: json['is_active'] as bool,
      enrollmentDate:
          DateFormatUtils.fromJsonDateTime(json['vinculate_date'] as String?),
    );
