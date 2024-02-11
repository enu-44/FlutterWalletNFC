import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/presentation/constant/assets.constant.dart';
import 'package:pago_facil_app/presentation/pages/auth/login/password/password_auth_cubit.dart';
import 'package:pago_facil_app/presentation/pages/auth/login/password/password_auth_state.dart';
import 'package:pago_facil_app/presentation/routes/app_routes.dart';
import 'package:pago_facil_app/presentation/widgets/button_widget.dart';
import 'package:pago_facil_app/presentation/widgets/input_widget.dart';

class PasswordAuthScreen extends StatelessWidget {
  const PasswordAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PasswordAuthCubit, PasswordAuthState>(
      listener: (context, state) {
        if (state is PasswordAuthSuccess) {
          Navigator.pushReplacementNamed(context, AppRoutes.home);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20.0),
                    Image.asset(AssetConst.password, width: 150, height: 150),
                    const SizedBox(height: 20),
                    Text(
                      "Escribe la clave de tu producto",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 20.0),
                    const InputWidget(
                      isPassword: true,
                      hintText: "Ingresar Clave",
                      labelText: "Clave",
                      icons: Icons.password,
                      inputType: TextInputType.number,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: ButtonWidget(
              icon: Icons.arrow_circle_right,
              text: "Continuar",
              onTap: () {},
            ),
          ),
        ),
      ),
    );
  }
}
