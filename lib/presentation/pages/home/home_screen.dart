import 'package:flutter/material.dart';
import 'package:pago_facil_app/presentation/widgets/card/card_expand_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enuar Munoz Castillo'),
      ),
      body: const Center(child: CardExpandWidget()),
    );
  }
}
