import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/features/auth/auth.dart';

class PasswordAuthCubit extends Cubit<PasswordAuthState> {
  PasswordAuthCubit() : super(PasswordAuthState.initial());

  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();

  @override
  Future<void> close() {
    passwordController.dispose();
    return super.close();
  }
}
