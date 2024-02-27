class Nfc {
  final String nfcId;
  final String serial;
  final DateTime enrollmentDate;
  final bool isActive;
  Nfc({
    required this.nfcId,
    required this.serial,
    required this.enrollmentDate,
    required this.isActive,
  });
}
