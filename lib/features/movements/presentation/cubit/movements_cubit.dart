import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/features/movements/movements.dart';
import 'package:pago_facil_app/layers/layers.dart';

class MovementsCubit extends Cubit<MovementsState> {
  MovementsCubit(this._movementRepository) : super(MovementsState.initial());
  final IMovementRepository _movementRepository;

  Future<void> load() async {
    emit(MovementsState.loading());
    final result = await _movementRepository.list();
    result.fold(
      (_) => emit(MovementsState.failure()),
      (_) => emit(MovementsState.success(_)),
    );
  }
}
