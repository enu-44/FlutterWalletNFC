import 'package:pago_facil_app/layers/layers.dart';

extension NfcMapper on NfcResponseDto {
  Nfc toDom() => Nfc(
      enrollmentDate: enrollmentDate ?? DateTime.now(),
      isActive: isActive,
      nfcId: nfcId,
      serial: serial);
}

extension EnrollNfcMapper on EnrollNfcRequest {
  EnrollNfcRequestDto toDto() =>
      EnrollNfcRequestDto(serial: serial, isActive: true);
}
