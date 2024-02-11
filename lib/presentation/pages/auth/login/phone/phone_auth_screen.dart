import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/presentation/constant/assets.constant.dart';
import 'package:pago_facil_app/presentation/pages/auth/login/phone/phone_auth_cubit.dart';
import 'package:pago_facil_app/presentation/pages/auth/login/phone/phone_auth_state.dart';
import 'package:pago_facil_app/presentation/pages/auth/widgets/header_auth_widget.dart';
import 'package:pago_facil_app/presentation/routes/app_routes.dart';
import 'package:pago_facil_app/presentation/utils/validators_utils.dart';
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
        validator: (value) => ValidatorUtil.validate([
          (_) => ValidatorUtil.requiredField(value),
          (_) => ValidatorUtil.numericOnly(value),
          (_) => ValidatorUtil.minLength(value, 8),
          (_) => ValidatorUtil.maxLength(value, 15)
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
