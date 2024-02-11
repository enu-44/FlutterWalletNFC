import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/presentation/pages/auth/login/phone/phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {
  PhoneAuthCubit() : super(PhoneAuthState.initial());

  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();

  @override
  Future<void> close() {
    phoneController.dispose();
    return super.close();
  }
}
