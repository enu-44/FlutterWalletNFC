import 'package:get_it/get_it.dart';
import 'package:pago_facil_app/layers/layers.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

class InjectorData {
  const InjectorData._();
  static Future<void> setupInjection() async {
    // Local
    locator.registerLazySingletonAsync<SharedPreferences>(
        () => SharedPreferences.getInstance());
    await GetIt.instance.isReady<SharedPreferences>();

    locator.registerLazySingleton<AuthPreference>(
        () => AuthPreference(locator.call()));

    // Api
    locator.registerLazySingleton<IDefaultHeaders>(
        () => ApiDefaultHeaders(locator.call()));

    // Auth
    locator.registerLazySingleton<IAuthRepository>(
        () => AuthRepository(locator.call(), locator.call()));
    locator.registerLazySingleton<ISessionRepository>(
        () => SessionRepository(locator.call()));

    // Movement
    locator.registerLazySingleton<IMovementRepository>(
        () => MovementRepository(locator.call()));

    // Nfc
    locator.registerLazySingleton<INfcRepository>(
        () => NfcRepository(locator.call()));

    // Wallet
    locator.registerLazySingleton<IWalletRepository>(
        () => WalletRepository(locator.call()));

    // Http
    locator.registerFactory<IHttpClient>(() => HttpClient(locator.call()));
  }
}
