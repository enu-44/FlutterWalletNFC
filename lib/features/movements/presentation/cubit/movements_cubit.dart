import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/features/movements/movements.dart';

class MovementsCubit extends Cubit<MovementsState> {
  MovementsCubit() : super(MovementsState.initial());

  Future<void> load() async {
    emit(MovementsState.success(
        ["", "", "", "", "", "", "", "", "", "", "", ""]));
  }
}
