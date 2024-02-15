import 'package:flutter/material.dart';

class AlertDialogWidget extends StatelessWidget {
  final String title;
  final String? message;
  final String confirmButtonText;
  final String? cancelButtonText;

  const AlertDialogWidget({
    super.key,
    required this.title,
    required this.message,
    required this.confirmButtonText,
    this.cancelButtonText,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content:
          message != null && message!.isNotEmpty ? Text(message ?? '') : null,
      actions: <Widget>[
        if (cancelButtonText != null)
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(cancelButtonText!),
          ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(confirmButtonText),
        ),
      ],
    );
  }
}
