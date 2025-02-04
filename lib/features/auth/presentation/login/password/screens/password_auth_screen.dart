import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/auth/auth.dart';

class PasswordAuthScreen extends StatelessWidget {
  const PasswordAuthScreen({super.key, required this.phone});
  final String phone;

  @override
  Widget build(BuildContext context) {
    context.read<PasswordAuthCubit>().phoneCtrl.text = phone;
    return BlocListener<PasswordAuthCubit, PasswordAuthState>(
      listener: (context, state) {
        if (state is PasswordAuthSuccess) {
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.home, (_) => false);
        }
        if (state is PasswordAuthFailure) {
          CustomDialog.info(context, message: state.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.white,
          foregroundColor: Palette.black,
        ),
        body: _buildContentBody(context),
        bottomNavigationBar: _buildNextButton(context),
      ),
    );
  }

  Widget _buildNextButton(BuildContext context) => SizedBox(
        height: kBottomNavigationBarHeight,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: BlocBuilder<PasswordAuthCubit, PasswordAuthState>(
            builder: (BuildContext _, PasswordAuthState state) {
              return ButtonWidget(
                text:
                    state is PasswordAuthLoading ? state.message : "Continuar",
                disabled: state is PasswordAuthLoading,
                icon: Icons.arrow_circle_right,
                onTap: () => _onSubmitForm(context),
              );
            },
          ),
        ),
      );

  Widget _buildContentBody(BuildContext _) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderAuthWidget(
                pathLogo: AssetConst.logo,
                title: "Escribe la clave de tu producto",
              ),
              _buildForm(_),
              const SizedBox(height: 10.0),
              _buildLoading()
            ],
          ),
        ),
      );

  Widget _buildLoading() => BlocBuilder<PasswordAuthCubit, PasswordAuthState>(
      builder: (BuildContext _, PasswordAuthState state) =>
          state is PasswordAuthLoading
              ? const CircularProgressIndicator()
              : const SizedBox.shrink());

  Widget _buildForm(BuildContext _) => Form(
        key: _.read<PasswordAuthCubit>().formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: InputWidget(
          controller: _.read<PasswordAuthCubit>().passwordCtrl,
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

  void _onSubmitForm(BuildContext _) {
    if (!_.read<PasswordAuthCubit>().isValidForm()) return;
    _.read<PasswordAuthCubit>().onValidatePassword();
  }
}
