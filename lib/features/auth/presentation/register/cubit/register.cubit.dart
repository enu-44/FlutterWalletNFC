import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/features/auth/auth.dart';
import 'package:pago_facil_app/layers/layers.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._authRepository) : super(RegisterState.initial());

  final IAuthRepository _authRepository;

  final formKey = GlobalKey<FormState>();
  final fullNameCtrl = TextEditingController();
  final idNumberCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final confirmPasswordCtrl = TextEditingController();
  final idTypeController =
      TextEditingController(text: identificationsType.first);
  final ValueNotifier<bool> acceptTermsConditionsCtrl =
      ValueNotifier<bool>(false);

  bool isValidForm() => formKey.currentState!.validate();

  Future<void> onRegister() async {
    emit(RegisterState.loading());
    final resul = await _authRepository.createAccount(CreateAccountRequest(
      fullName: fullNameCtrl.text,
      idNumber: idNumberCtrl.text,
      idType: idNumberCtrl.text,
      password: passwordCtrl.text,
      phoneNumber: phoneCtrl.text,
    ));
    resul.fold(
      (_) => emit(RegisterState.failure()),
      (_) => emit(RegisterState.success()),
    );
  }

  @override
  Future<void> close() {
    fullNameCtrl.dispose();
    idNumberCtrl.dispose();
    passwordCtrl.dispose();
    phoneCtrl.dispose();
    confirmPasswordCtrl.dispose();
    idTypeController.dispose();
    acceptTermsConditionsCtrl.dispose();
    return super.close();
  }
}

List<String> identificationsType = [
  "Cedula de Ciudadania",
  "Pasaporte",
  "Cedula Extranjeria"
];
