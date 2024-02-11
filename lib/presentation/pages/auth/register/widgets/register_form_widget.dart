import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/presentation/pages/auth/register/register.cubit.dart';
import 'package:pago_facil_app/presentation/utils/validators_utils.dart';
import 'package:pago_facil_app/presentation/widgets/checkbox_widget.dart';
import 'package:pago_facil_app/presentation/widgets/dropdown_widget.dart';
import 'package:pago_facil_app/presentation/widgets/input_widget.dart';

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
          _buildFullNameFormField(cubit.fullNameController),
          const SizedBox(height: 15.0),
          _buildIdTypeFormField(cubit.idTypeController),
          const SizedBox(height: 15.0),
          _buildIdNumberFormField(cubit.idNumberController),
          const SizedBox(height: 15.0),
          _buildPhoneFormField(cubit.phoneController),
          const SizedBox(height: 15.0),
          _buildPasswordFormField(cubit.passwordController),
          const SizedBox(height: 15.0),
          _buildConfirmPasswordFormField(
              cubit.confirmPasswordController, context),
          const SizedBox(height: 15.0),
          _buildAccepTermsFormField(cubit.acceptTermsConditionsController)
        ],
      ),
    );
  }

  Widget _buildFullNameFormField(TextEditingController controller) {
    return InputWidget(
      controller: controller,
      hintText: "Nombre Completo",
      labelText: "Nombre Completo",
      icons: Icons.person,
      inputType: TextInputType.text,
      validator: (value) => ValidatorUtil.validate([
        (_) => ValidatorUtil.requiredField(value),
        (_) => ValidatorUtil.maxLength(value, 20)
      ]),
    );
  }

  Widget _buildIdTypeFormField(TextEditingController controller) {
    return DropdownWidget<String>(
        labelText: "Tipo de Identificacion",
        hintText: "Seleccione una opcion",
        items: identificationsType,
        controller: controller,
        displayText: (item) => item);
  }

  Widget _buildIdNumberFormField(TextEditingController controller) {
    return InputWidget(
      controller: controller,
      hintText: "Ingresar Identificacion",
      labelText: "Identificacion",
      icons: Icons.numbers,
      inputType: TextInputType.text,
      validator: (value) => ValidatorUtil.validate([
        (_) => ValidatorUtil.requiredField(value),
        (_) => ValidatorUtil.numericOnly(value),
        (_) => ValidatorUtil.minLength(value, 4),
        (_) => ValidatorUtil.maxLength(value, 15)
      ]),
    );
  }

  Widget _buildPhoneFormField(TextEditingController controller) {
    return InputWidget(
      controller: controller,
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
    );
  }

  Widget _buildPasswordFormField(TextEditingController controller) {
    return InputWidget(
      controller: controller,
      hintText: "Ingresar Clave",
      labelText: "Clave",
      icons: Icons.lock,
      inputType: TextInputType.number,
      validator: (value) => ValidatorUtil.validate([
        (_) => ValidatorUtil.requiredField(value),
        (_) => ValidatorUtil.numericOnly(value),
        (_) => ValidatorUtil.minLength(value, 4),
        (_) => ValidatorUtil.maxLength(value, 5)
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
      validator: (value) => ValidatorUtil.validate([
        (_) => ValidatorUtil.requiredField(value),
        (_) => ValidatorUtil.numericOnly(value),
        (_) => ValidatorUtil.minLength(value, 4),
        (_) => ValidatorUtil.maxLength(value, 5),
        (_) => ValidatorUtil.confirmEqual(
            value, context.read<RegisterCubit>().passwordController.text,
            message: () => 'El valor de la contrasena no coincide')
      ]),
    );
  }

  Widget _buildAccepTermsFormField(ValueNotifier<bool> controller) {
    return CheckboxWidget(
        controller: controller, label: "Acepto terminos y condiciones");
  }
}
