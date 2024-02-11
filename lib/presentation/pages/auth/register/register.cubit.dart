import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/presentation/pages/auth/register/register.state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState.initial());

  final formKey = GlobalKey<FormState>();
  final fullNameController = TextEditingController();
  final idNumberController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final idTypeController =
      TextEditingController(text: identificationsType.first);
  final ValueNotifier<bool> acceptTermsConditionsController =
      ValueNotifier<bool>(false);

  @override
  Future<void> close() {
    fullNameController.dispose();
    idNumberController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}

List<String> identificationsType = [
  "Cedula de Ciudadania",
  "Pasaporte",
  "Cedula Extranjeria"
];
