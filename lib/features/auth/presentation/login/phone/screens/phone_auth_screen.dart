import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/auth/auth.dart';

class PhoneAuthScreen extends StatelessWidget {
  const PhoneAuthScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listener: (context, state) {
        if (state is PhoneAuthSuccess) {
          Navigator.pushNamed(context, AppRoutes.passwordAuthVerfication);
        }
        if (state is PhoneAuthFailure) {}
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: _contentWidget(context),
        ),
        bottomNavigationBar: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: ButtonWidget(
              text: "Continuar",
              icon: Icons.arrow_circle_right,
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
            title: "Accede a tu cuenta",
          ),
          _createFormWidget(context),
          _createAccountWidget(context)
        ],
      ),
    );
  }

  Widget _createFormWidget(BuildContext context) {
    return Form(
      key: context.read<PhoneAuthCubit>().formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: InputWidget(
        controller: context.read<PhoneAuthCubit>().phoneController,
        hintText: "Ingresar Telefono",
        labelText: "Telefono",
        icons: Icons.phone,
        inputType: TextInputType.number,
        validator: (value) => FormValidatorsUtils.validate([
          (_) => FormValidatorsUtils.requiredField(value),
          (_) => FormValidatorsUtils.numericOnly(value),
          (_) => FormValidatorsUtils.minLength(value, 8),
          (_) => FormValidatorsUtils.maxLength(value, 15)
        ]),
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

  void _submitForm(BuildContext context) {
    if (context.read<PhoneAuthCubit>().formKey.currentState!.validate()) {
      Navigator.pushNamed(context, AppRoutes.passwordAuthVerfication);
    }
  }
}
