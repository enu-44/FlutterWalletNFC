import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/auth/auth.dart';

class RegisterFormWidget extends StatelessWidget {
  const RegisterFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return Form(
      key: cubit.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          const SizedBox(height: 15.0),
          _buildFullNameFormField(cubit.fullNameCtrl),
          const SizedBox(height: 15.0),
          _buildIdTypeFormField(cubit.idTypeController),
          const SizedBox(height: 15.0),
          _buildIdNumberFormField(cubit.idNumberCtrl),
          const SizedBox(height: 15.0),
          _buildPhoneFormField(cubit.phoneCtrl),
          const SizedBox(height: 15.0),
          _buildPasswordFormField(cubit.passwordCtrl),
          const SizedBox(height: 15.0),
          _buildConfirmPasswordFormField(cubit.confirmPasswordCtrl, context),
          const SizedBox(height: 15.0),
          _buildAccepTermsFormField(cubit.acceptTermsConditionsCtrl),
          const SizedBox(height: 10.0),
          _buildLoading()
        ],
      ),
    );
  }

  Widget _buildLoading() => BlocBuilder<RegisterCubit, RegisterState>(
      builder: (BuildContext _, RegisterState state) => state is RegisterLoading
          ? const CircularProgressIndicator()
          : const SizedBox.shrink());

  Widget _buildFullNameFormField(TextEditingController controller) {
    return InputWidget(
      controller: controller,
      hintText: "Nombre Completo",
      labelText: "Nombre Completo",
      icons: Icons.person,
      inputType: TextInputType.text,
      validator: (value) => FormValidatorsUtils.validate([
        (_) => FormValidatorsUtils.requiredField(value),
        (_) => FormValidatorsUtils.maxLength(value, 40)
      ]),
    );
  }

  Widget _buildIdTypeFormField(TextEditingController controller) {
    return DropdownWidget<String>(
        labelText: "Tipo de Identificación",
        hintText: "Seleccione una opción",
        items: identificationsType,
        controller: controller,
        displayText: (item) => item);
  }

  Widget _buildIdNumberFormField(TextEditingController controller) {
    return InputWidget(
      controller: controller,
      hintText: "Ingresar Identificación",
      labelText: "Identificación",
      icons: Icons.numbers,
      inputType: TextInputType.number,
      validator: (value) => FormValidatorsUtils.validate([
        (_) => FormValidatorsUtils.requiredField(value),
        (_) => FormValidatorsUtils.numericOnly(value),
        (_) => FormValidatorsUtils.minLength(value, 4),
        (_) => FormValidatorsUtils.maxLength(value, 15)
      ]),
    );
  }

  Widget _buildPhoneFormField(TextEditingController controller) {
    return InputWidget(
      controller: controller,
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
    );
  }

  Widget _buildPasswordFormField(TextEditingController controller) {
    return InputWidget(
      controller: controller,
      hintText: "Ingresar Clave",
      labelText: "Clave",
      icons: Icons.lock,
      inputType: TextInputType.number,
      isPassword: true,
      validator: (value) => FormValidatorsUtils.validate([
        (_) => FormValidatorsUtils.requiredField(value),
        (_) => FormValidatorsUtils.numericOnly(value),
        (_) => FormValidatorsUtils.minLength(value, 4),
        (_) => FormValidatorsUtils.maxLength(value, 5)
      ]),
    );
  }

  Widget _buildConfirmPasswordFormField(
      TextEditingController controller, BuildContext context) {
    return InputWidget(
      controller: controller,
      hintText: "Confirmar Clave",
      labelText: "Confirmar Clave",
      icons: Icons.lock,
      inputType: TextInputType.number,
      isPassword: true,
      validator: (value) => FormValidatorsUtils.validate([
        (_) => FormValidatorsUtils.requiredField(value),
        (_) => FormValidatorsUtils.numericOnly(value),
        (_) => FormValidatorsUtils.minLength(value, 4),
        (_) => FormValidatorsUtils.maxLength(value, 5),
        (_) => FormValidatorsUtils.confirmEqual(
            value, context.read<RegisterCubit>().passwordCtrl.text,
            message: () => 'El valor de la clave no coincide')
      ]),
    );
  }

  Widget _buildAccepTermsFormField(ValueNotifier<bool> controller) {
    return CheckboxWidget(
        controller: controller, label: "Acepto terminos y condiciones");
  }
}
