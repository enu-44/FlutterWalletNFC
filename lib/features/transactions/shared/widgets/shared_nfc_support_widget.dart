import 'package:flutter/material.dart';
import 'package:pago_facil_app/core/core.dart';

class SharedNfcSupportWidget extends StatelessWidget {
  const SharedNfcSupportWidget({
    super.key,
    required this.buildContent,
    this.shouldShowUnsupported,
  });
  final Widget Function() buildContent;
  final bool Function()? shouldShowUnsupported;

  @override
  Widget build(BuildContext context) => FutureBuilder(
        future: NfcUtils.isAvailable(),
        builder: (_, snap) {
          if (snap.data == false) {
            if (shouldShowUnsupported?.call() == false) return const SizedBox();
            return const Center(child: UnsupportedNfcWidget());
          }
          return buildContent();
        },
      );
}
