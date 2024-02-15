import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/features.dart';

class GenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    final routes = <String, MaterialPageRoute>{
      AppRoutes.splash: routeBuilder(
          buildBlocProvider(const SplashScreen(), SplashCubit()..onSignIn())),
      AppRoutes.phoneAuthVerfication: routeBuilder(
          buildBlocProvider(const PhoneAuthScreen(), PhoneAuthCubit())),
      AppRoutes.passwordAuthVerfication: routeBuilder(
          buildBlocProvider(const PasswordAuthScreen(), PasswordAuthCubit())),
      AppRoutes.register: routeBuilder(
          buildBlocProvider(const RegisterScreen(), RegisterCubit())),
      AppRoutes.home: routeBuilder(buildMultiBlocProvider(
        HomeScreen(),
        [
          BlocProvider<HomeCubit>(create: (context) => HomeCubit()..load()),
          BlocProvider<MovementsCubit>(
              create: (context) => MovementsCubit()..load()),
          BlocProvider<AvailableBalanceCubit>(
              create: (context) => AvailableBalanceCubit()..load()),
        ],
      )),
      AppRoutes.receivedMoney: routeBuilder(
          buildBlocProvider(const ReceiveMoneyScreen(), ReceiveMoneyCubit())),
      AppRoutes.sendMoney: routeBuilder(
          buildBlocProvider(const SendMoneyScreen(), SendMoneyCubit())),
      AppRoutes.rechargeBalance: routeBuilder(buildBlocProvider(
          const RechargeBalanceWidget(), RechargeBalanceCubit())),
      AppRoutes.nfcDevices: routeBuilder(buildBlocProvider(
          const NfcDevicesScreen(), NfcDevicesCubit()..load())),
      AppRoutes.nfcPairingDevice: routeBuilder(buildBlocProvider(
          const NfcDevicePairingScreen(), NfcDevicesPairingCubit())),
    };
    return routes[settings.name] ??
        MaterialPageRoute(builder: (_) => const NoPageFoundScreen());
  }
}

Widget buildBlocProvider<T extends Cubit>(
  Widget child,
  T cubit,
) {
  return BlocProvider<T>(
    create: (BuildContext context) => cubit,
    child: child,
  );
}

Widget buildMultiBlocProvider(
  Widget child,
  List<BlocProvider<dynamic>> providers,
) {
  return MultiBlocProvider(
    providers: providers,
    child: child,
  );
}

MaterialPageRoute routeBuilder(Widget child, {dynamic arguments}) {
  return MaterialPageRoute(
      builder: (context) => child,
      settings: RouteSettings(arguments: arguments));
}
