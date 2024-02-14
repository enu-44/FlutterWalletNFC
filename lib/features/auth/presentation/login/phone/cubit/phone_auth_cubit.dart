import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/features/auth/auth.dart';

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
