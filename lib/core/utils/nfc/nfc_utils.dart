import 'package:nfc_manager/nfc_manager.dart';
import 'package:pago_facil_app/core/utils/utils.dart';

class NfcUtils {
  const NfcUtils._();

  static startSession({required void Function(String) onNfc}) async {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      String? nfcId = NfcIdentifierUtils.getIndentifier(tag);
      if (nfcId == null) return;
      onNfc(nfcId);
    });
  }

  static closeNfc() => NfcManager.instance.stopSession();
  static Future<bool> isAvailable() => NfcManager.instance.isAvailable();
}
