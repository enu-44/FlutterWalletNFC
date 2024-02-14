import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/features/home/home.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());
  Future<void> load() async {
    emit(HomeState.success('Enuar Munoz Castillo'));
  }
}
