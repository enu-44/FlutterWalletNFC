import 'package:flutter/material.dart';
import 'package:pago_facil_app/presentation/config/size_config.dart';
import 'package:pago_facil_app/presentation/routes/app_routes.dart';
import 'package:pago_facil_app/presentation/routes/generate_routes.dart';
import 'package:pago_facil_app/presentation/theme/theme.dart';

void main() {
  runApp(const PagoFacilApp());
}

class PagoFacilApp extends StatelessWidget {
  const PagoFacilApp({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MaterialApp(
      title: 'Pago Facil',
      theme: theme(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: GenerateRoute.route,
      initialRoute: AppRoutes.splash,
    );
  }
}
