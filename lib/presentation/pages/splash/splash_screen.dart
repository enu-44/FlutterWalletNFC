import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/presentation/constant/assets.constant.dart';
import 'package:pago_facil_app/presentation/pages/splash/splash_cubit.dart';
import 'package:pago_facil_app/presentation/pages/splash/splash_state.dart';
import 'package:pago_facil_app/presentation/routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is SplashEnd) {
          Navigator.pushReplacementNamed(
              context, AppRoutes.phoneAuthVerfication);
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AssetConst.logo, width: 250, height: 250),
              const SizedBox(height: 20),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
