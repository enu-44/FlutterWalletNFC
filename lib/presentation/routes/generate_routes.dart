import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/presentation/pages/auth/login/password/password_auth_cubit.dart';
import 'package:pago_facil_app/presentation/pages/auth/login/password/password_auth_screen.dart';
import 'package:pago_facil_app/presentation/pages/auth/login/phone/phone_auth_cubit.dart';
import 'package:pago_facil_app/presentation/pages/auth/login/phone/phone_auth_screen.dart';
import 'package:pago_facil_app/presentation/pages/auth/register/register.cubit.dart';
import 'package:pago_facil_app/presentation/pages/auth/register/register_screen.dart';
import 'package:pago_facil_app/presentation/pages/home/home_cubit.dart';
import 'package:pago_facil_app/presentation/pages/home/home_screen.dart';
import 'package:pago_facil_app/presentation/pages/not_found/not_found_screen.dart';
import 'package:pago_facil_app/presentation/pages/splash/splash_cubit.dart';
import 'package:pago_facil_app/presentation/pages/splash/splash_screen.dart';
import 'package:pago_facil_app/presentation/routes/app_routes.dart';

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
      AppRoutes.home:
          routeBuilder(buildBlocProvider(const HomeScreen(), HomeCubit())),
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

MaterialPageRoute routeBuilder(Widget child, {dynamic arguments}) {
  return MaterialPageRoute(
      builder: (context) => child,
      settings: RouteSettings(arguments: arguments));
}
