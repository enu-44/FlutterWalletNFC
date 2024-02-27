import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/features/splash/splash.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.initial());

  Future<void> onSetup() async {
    Timer(
      const Duration(seconds: 3),
      () => emit(SplashState.finished()),
    );
  }
}
