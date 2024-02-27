import 'dart:typed_data';

import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';

class NfcIdentifierUtils {
  const NfcIdentifierUtils._();

  static String? getIndentifier(NfcTag tag) {
    final mapIdentifer = <String, Uint8List?>{
      "iso7816": Iso7816.from(tag)?.identifier,
      "iso15693": Iso15693.from(tag)?.identifier,
      "mifare": MiFare.from(tag)?.identifier,
      "nfca": NfcA.from(tag)?.identifier,
      "nfcb": NfcB.from(tag)?.identifier,
      "nfcf": NfcF.from(tag)?.identifier,
      "nfcv": NfcV.from(tag)?.identifier,
      "isodep": IsoDep.from(tag)?.identifier,
      "mifareclassic": MifareClassic.from(tag)?.identifier,
      "mifareultralight": MifareUltralight.from(tag)?.identifier,
      "ndefformatable": NdefFormatable.from(tag)?.identifier,
    };

    final String? tagName = tag.data.keys.firstOrNull;
    if (tagName == null) return null;

    final Uint8List? idBytes = mapIdentifer[tagName];
    if (idBytes == null) return null;
    // utf8.decode(identifierBytes);
    return convertUint8ListToHexString(idBytes);
  }
}

String convertUint8ListToHexString(Uint8List data) {
  return data
      .map((byte) => byte.toRadixString(16).padLeft(2, '0'))
      .join(':')
      .toUpperCase();
}
