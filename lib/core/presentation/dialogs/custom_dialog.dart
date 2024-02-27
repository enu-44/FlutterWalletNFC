import 'package:flutter/material.dart';
import 'package:pago_facil_app/core/core.dart';

class CustomDialog {
  const CustomDialog._();

  static Future<bool> info(BuildContext context,
      {required String message,
      String title = "Notificación",
      String confirmButtonText = 'Aceptar'}) async {
    final value = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialogWidget(
            title: title,
            message: message,
            confirmButtonText: confirmButtonText);
      },
    );
    return value != null && value;
  }

  static Future<bool> confirm(BuildContext context,
      {required String message,
      String title = "Notificación",
      String confirmButtonText = 'Confirmar',
      String cancelButtonText = 'Cancelar'}) async {
    final value = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialogWidget(
          title: title,
          message: message,
          confirmButtonText: confirmButtonText,
          cancelButtonText: cancelButtonText,
        );
      },
    );
    return value != null && value;
  }
}
