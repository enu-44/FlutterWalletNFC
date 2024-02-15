import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/auth/auth.dart';

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
          backgroundColor: Palette.white,
          foregroundColor: Palette.black,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: _contentWidget(context),
        ),
        bottomNavigationBar: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: ButtonWidget(
              icon: Icons.arrow_circle_right,
              text: "Continuar",
              onTap: () => _submitForm(context),
            ),
          ),
        ),
      ),
    );
  }

  Widget _contentWidget(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HeaderAuthWidget(
            pathLogo: AssetConst.logo,
            title: "Escribe la clave de tu producto",
          ),
          _createFormWidget(context)
        ],
      ),
    );
  }

  Widget _createFormWidget(BuildContext context) {
    return Form(
      key: context.read<PasswordAuthCubit>().formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: InputWidget(
        controller: context.read<PasswordAuthCubit>().passwordController,
        focusNode: FocusNode()..requestFocus(),
        isPassword: true,
        hintText: "Ingresar Clave",
        labelText: "Clave",
        icons: Icons.lock,
        inputType: TextInputType.number,
        validator: (value) => FormValidatorsUtils.validate([
          (_) => FormValidatorsUtils.requiredField(value),
          (_) => FormValidatorsUtils.numericOnly(value),
          (_) => FormValidatorsUtils.minLength(value, 4),
          (_) => FormValidatorsUtils.maxLength(value, 5),
        ]),
      ),
    );
  }

  void _submitForm(BuildContext context) {
    if (context.read<PasswordAuthCubit>().formKey.currentState!.validate()) {
      Navigator.pushNamed(context, AppRoutes.home);
    }
  }
}
