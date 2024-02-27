import 'package:get_it/get_it.dart';
import 'package:pago_facil_app/features/features.dart';

final locator = GetIt.instance;

class CubitProvider {
  const CubitProvider._();

  static void setup() {
    // Auth
    locator.registerFactory(() => RegisterCubit(locator.call()));
    locator.registerFactory(() => PhoneAuthCubit(locator.call()));
    locator.registerFactory(() => PasswordAuthCubit(locator.call()));

    // Transactions
    locator.registerFactory(() => ReceiveMoneyCubit(locator.call()));
    locator.registerFactory(() => SendMoneyCubit(locator.call()));
    locator.registerFactory(() => RechargeBalanceCubit(locator.call()));

    // Nfc
    locator.registerFactory(() => NfcDevicesCubit(locator.call()));
    locator.registerFactory(() => NfcPairingCubit(locator.call()));

    // Movements
    locator.registerFactory(() => MovementsCubit(locator.call()));

    // Wallet
    locator.registerFactory(() => AvailableBalanceCubit(locator.call()));

    // Home
    locator.registerFactory(() => HomeCubit(locator.call()));
  }
}
