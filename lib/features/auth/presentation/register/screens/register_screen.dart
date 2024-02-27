import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/auth/auth.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (_, state) {
        FocusScope.of(context).unfocus();
        if (state is RegisterSuccess) {
          Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (_) => false);
        }
        if (state is RegisterFailure) {
          CustomDialog.info(context, message: state.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Registrate'),
          backgroundColor: Palette.white,
          foregroundColor: Palette.black,
        ),
        body: _buildContentBody(),
        bottomNavigationBar: _buildNextButton(context),
      ),
    );
  }

  Widget _buildContentBody() => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: RegisterFormWidget(),
        ),
      );

  Widget _buildNextButton(BuildContext context) => SizedBox(
        height: kBottomNavigationBarHeight,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: ValueListenableBuilder(
            valueListenable:
                context.read<RegisterCubit>().acceptTermsConditionsCtrl,
            builder: (_, bool value, child) {
              return BlocBuilder<RegisterCubit, RegisterState>(
                builder: (BuildContext __, RegisterState state) {
                  return ButtonWidget(
                    text:
                        state is RegisterLoading ? state.message : "Continuar",
                    disabled: state is RegisterLoading || value == false,
                    icon: Icons.arrow_circle_right,
                    onTap: () => _onSubmit(context),
                  );
                },
              );
            },
          ),
        ),
      );

  void _onSubmit(BuildContext _) {
    if (!_.read<RegisterCubit>().isValidForm()) return;
    _.read<RegisterCubit>().onRegister();
  }
}
