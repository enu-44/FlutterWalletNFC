import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/features/auth/auth.dart';
import 'package:pago_facil_app/layers/layers.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  PhoneAuthCubit(this.authRepository) : super(PhoneAuthState.initial());

  final IAuthRepository authRepository;

  final formKey = GlobalKey<FormState>();
  final phoneCtrl = TextEditingController();

  bool isValidForm() => formKey.currentState!.validate();
  Future<void> onValidatePhone() async {
    emit(PhoneAuthState.loading());
    final resul = await authRepository.checkPhone(phoneCtrl.text);
    resul.fold(
      (Failure failure) => emit(PhoneAuthState.failure()),
      (NoResult result) => emit(PhoneAuthState.success()),
    );
  }

  @override
  Future<void> close() {
    phoneCtrl.dispose();
    return super.close();
  }
}
