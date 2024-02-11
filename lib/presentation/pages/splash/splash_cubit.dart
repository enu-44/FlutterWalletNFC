import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/presentation/pages/splash/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.initial());

  Future<void> onSignIn() async {
    Timer(
      const Duration(seconds: 5),
      () async {
        emit(SplashState.finished());
      },
    );
  }
}
