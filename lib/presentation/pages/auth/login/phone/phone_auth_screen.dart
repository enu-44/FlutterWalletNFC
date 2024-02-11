import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/presentation/constant/assets.constant.dart';
import 'package:pago_facil_app/presentation/pages/auth/login/phone/phone_auth_cubit.dart';
import 'package:pago_facil_app/presentation/pages/auth/login/phone/phone_auth_state.dart';
import 'package:pago_facil_app/presentation/routes/app_routes.dart';
import 'package:pago_facil_app/presentation/widgets/button_widget.dart';
import 'package:pago_facil_app/presentation/widgets/hyperlink_widget.dart';
import 'package:pago_facil_app/presentation/widgets/input_widget.dart';

class PhoneAuthScreen extends StatelessWidget {
  const PhoneAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listener: (context, state) {
        if (state is PhoneAuthSuccess) {
          Navigator.pushNamed(context, AppRoutes.home);
        }
        if (state is PhoneAuthFailure) {}
      },
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20.0),
                    Image.asset(AssetConst.logo, width: 150, height: 150),
                    const SizedBox(height: 20),
                    Text(
                      "Escribe la clave de tu producto",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 20.0),
                    const InputWidget(
                      hintText: "Ingresar Telefono",
                      labelText: "Telefono",
                      icons: Icons.phone,
                      inputType: TextInputType.number,
                    ),
                    _createAccountWidget(context)
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
              text: "Continuar",
              icon: Icons.arrow_circle_right,
              onTap: () => Navigator.pushNamed(
                  context, AppRoutes.passwordAuthVerfication),
            ),
          ),
        ),
      ),
    );
  }

  Widget _createAccountWidget(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: HyperlinkWidget(
          title: "Crear cuenta",
          onTap: () => Navigator.pushNamed(context, AppRoutes.register)),
    );
  }
}
