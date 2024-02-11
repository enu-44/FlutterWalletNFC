import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/presentation/pages/auth/register/register.cubit.dart';
import 'package:pago_facil_app/presentation/pages/auth/register/register.state.dart';
import 'package:pago_facil_app/presentation/pages/auth/register/widgets/register_form_widget.dart';
import 'package:pago_facil_app/presentation/routes/app_routes.dart';
import 'package:pago_facil_app/presentation/widgets/button_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          Navigator.pushNamed(context, AppRoutes.home);
        }
        if (state is RegisterFailure) {}
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Registrate'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: _contentWidget(context),
        ),
        bottomNavigationBar: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: ValueListenableBuilder(
              valueListenable:
                  context.read<RegisterCubit>().acceptTermsConditionsController,
              builder: (context, bool value, child) {
                return ButtonWidget(
                  text: "Continuar",
                  disabled: value == false,
                  icon: Icons.arrow_circle_right,
                  onTap: () => _submitForm(context),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _contentWidget(BuildContext context) {
    return const SingleChildScrollView(
      child: RegisterFormWidget(),
    );
  }

  void _submitForm(BuildContext context) {
    if (context.read<RegisterCubit>().formKey.currentState!.validate()) {
      Navigator.pushNamed(context, AppRoutes.home);
    }
  }
}
