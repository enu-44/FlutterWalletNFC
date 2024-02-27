import 'package:flutter/material.dart';

class UnsupportedNfcWidget extends StatelessWidget {
  const UnsupportedNfcWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "NFC no disponible",
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
