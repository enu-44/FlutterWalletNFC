import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pago_facil_app/core/routes/app_routes.dart';
import 'package:pago_facil_app/core/routes/generate_routes.dart';
import 'package:pago_facil_app/core/theme/pago_facil_theme.dart';

void main() {
  Intl.defaultLocale = 'es_ES'; // PM
  initializeDateFormatting();
  runApp(const PagoFacilApp());
}

class PagoFacilApp extends StatelessWidget {
  const PagoFacilApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pago Facil',
        theme: FlutPagoFacilTheme.light,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: GenerateRoute.route,
        initialRoute: AppRoutes.home);
  }
}
