import 'package:flutter/material.dart';
import 'package:pago_facil_app/core/core.dart';

class NoPageFoundScreen extends StatelessWidget {
  const NoPageFoundScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Page not found"),
            const SizedBox(height: 20.0),
            ButtonWidget(
              text: "Volver",
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, AppRoutes.splash, (_) => false),
            )
          ],
        ),
      ),
    );
  }
}
