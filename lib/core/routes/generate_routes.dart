import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/features.dart';
import 'package:pago_facil_app/core/injector/cubit_provider.dart' as di;

class GenerateRoute {
  static Route<dynamic>? route(RouteSettings settings) {
    final args = settings.arguments;

    final routes = <String, MaterialPageRoute>{
      AppRoutes.splash: routeBuilder(
          buildBlocProvider(const SplashScreen(), SplashCubit()..onSetup())),
      AppRoutes.phoneAuthVerfication: routeBuilder(buildBlocProvider(
          const PhoneAuthScreen(), di.locator<PhoneAuthCubit>())),
      AppRoutes.passwordAuthVerfication: routeBuilder(buildBlocProvider(
          PasswordAuthScreen(
            phone: args.toString(),
          ),
          di.locator<PasswordAuthCubit>())),
      AppRoutes.register: routeBuilder(buildBlocProvider(
          const RegisterScreen(), di.locator<RegisterCubit>())),
      AppRoutes.home: routeBuilder(buildMultiBlocProvider(
        HomeScreen(),
        [
          BlocProvider<HomeCubit>(
              create: (context) => di.locator<HomeCubit>()..load()),
          BlocProvider<MovementsCubit>(
              create: (context) => di.locator<MovementsCubit>()..load()),
          BlocProvider<AvailableBalanceCubit>(
              create: (context) => di.locator<AvailableBalanceCubit>()..load()),
        ],
      )),
      AppRoutes.receivedMoney: routeBuilder(buildBlocProvider(
          const ReceiveMoneyScreen(), di.locator<ReceiveMoneyCubit>())),
      AppRoutes.sendMoney: routeBuilder(buildBlocProvider(
          const SendMoneyScreen(), di.locator<SendMoneyCubit>())),
      AppRoutes.rechargeBalance: routeBuilder(buildBlocProvider(
          const RechargeBalanceWidget(), di.locator<RechargeBalanceCubit>())),
      AppRoutes.nfcDevices: routeBuilder(buildBlocProvider(
          const NfcDevicesScreen(), di.locator<NfcDevicesCubit>()..load())),
      AppRoutes.nfcPairingDevice: routeBuilder(buildBlocProvider(
          const NfcPairingScreen(), di.locator<NfcPairingCubit>())),
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
