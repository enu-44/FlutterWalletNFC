import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:pago_facil_app/core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Intl.defaultLocale = 'es_ES'; // PM
  initializeDateFormatting();
  await LayersProvider.setup();
  CubitProvider.setup();
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
        initialRoute: AppRoutes.splash);
  }
}
