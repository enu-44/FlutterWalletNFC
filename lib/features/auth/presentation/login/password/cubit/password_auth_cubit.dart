import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/features/auth/auth.dart';
import 'package:pago_facil_app/layers/layers.dart';

class PasswordAuthCubit extends Cubit<PasswordAuthState> {
  PasswordAuthCubit(this._authRepository) : super(PasswordAuthState.initial());

  final IAuthRepository _authRepository;

  final formKey = GlobalKey<FormState>();
  final passwordCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();

  Future<void> onValidatePassword() async {
    emit(PasswordAuthState.loading());
    final resul =
        await _authRepository.checkPassword(phoneCtrl.text, passwordCtrl.text);
    resul.fold(
      (_) => emit(PasswordAuthState.failure()),
      (_) => emit(PasswordAuthState.success()),
    );
  }

  bool isValidForm() => formKey.currentState!.validate();

  @override
  Future<void> close() {
    passwordCtrl.dispose();
    return super.close();
  }
}
