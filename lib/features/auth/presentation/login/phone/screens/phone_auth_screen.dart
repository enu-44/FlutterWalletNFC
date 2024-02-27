import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/auth/auth.dart';

class PhoneAuthScreen extends StatelessWidget {
  const PhoneAuthScreen({super.key});

  void _cubitListener(
      BuildContext _, PhoneAuthState state, PhoneAuthCubit cubit) async {
    if (state is PhoneAuthSuccess) {
      Navigator.pushNamed(_, AppRoutes.passwordAuthVerfication,
          arguments: cubit.phoneCtrl.text);
    }
    if (state is PhoneAuthFailure) CustomDialog.info(_, message: state.message);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listener: (_, state) =>
          _cubitListener(_, state, context.read<PhoneAuthCubit>()),
      child: Scaffold(
        body: _buildContentBody(context),
        bottomNavigationBar: _buildNextButton(context),
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) => SizedBox(
        height: kBottomNavigationBarHeight,
        child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: BlocBuilder<PhoneAuthCubit, PhoneAuthState>(
              builder: (BuildContext _, PhoneAuthState state) {
                return ButtonWidget(
                  text: state is PhoneAuthLoading ? state.message : "Continuar",
                  disabled: state is PhoneAuthLoading,
                  icon: Icons.arrow_circle_right,
                  onTap: () => _onSubmitForm(context),
                );
              },
            )),
      );

  Widget _buildContentBody(BuildContext _) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderAuthWidget(
                pathLogo: AssetConst.logo,
                title: "Accede a tu cuenta",
              ),
              _buildForm(_),
              _buildAccountWidget(_),
              const SizedBox(height: 10.0),
              BlocBuilder<PhoneAuthCubit, PhoneAuthState>(
                builder: (BuildContext _, PhoneAuthState state) {
                  if (state is PhoneAuthLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return const SizedBox.shrink();
                },
              )
            ],
          ),
        ),
      );

  Widget _buildForm(BuildContext _) => Form(
        key: _.read<PhoneAuthCubit>().formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: InputWidget(
          controller: _.read<PhoneAuthCubit>().phoneCtrl,
          hintText: "Ingresar Teléfono",
          labelText: "Teléfono",
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

  Widget _buildAccountWidget(BuildContext _) => Align(
        alignment: Alignment.centerRight,
        child: HyperlinkWidget(
            title: "Crear cuenta",
            onTap: () => Navigator.pushNamed(_, AppRoutes.register)),
      );

  void _onSubmitForm(BuildContext _) {
    if (!_.read<PhoneAuthCubit>().isValidForm()) return;
    _.read<PhoneAuthCubit>().onValidatePhone();
  }
}
