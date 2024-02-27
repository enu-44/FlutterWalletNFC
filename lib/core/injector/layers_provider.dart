import 'package:pago_facil_app/layers/layers.dart';

class LayersProvider {
  const LayersProvider._();

  static Future<void> setup() async {
    await InjectorData.setupInjection();
    
  }
}
