import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/presentation/pages/auth/login/password/password_auth_state.dart';

class PasswordAuthCubit extends Cubit<PasswordAuthState> {
  PasswordAuthCubit() : super(PasswordAuthState.initial());
}
