import 'package:pago_facil_app/layers/layers.dart';

abstract class MovementsState {
  MovementsState();
  factory MovementsState.initial() => MovementsInitial();
  factory MovementsState.success(List<Movement> movements) =>
      movements.isEmpty ? MovementsEmpty() : MovementsSuccess(movements);
  factory MovementsState.failure() => MovementsFailure();
  factory MovementsState.loading() => MovementsLoading();
}

class MovementsInitial extends MovementsState {}

class MovementsSuccess extends MovementsState {
  final List<Movement> movements;
  MovementsSuccess(this.movements) : super();
}

class MovementsEmpty extends MovementsState {}

class MovementsFailure extends MovementsState {}

class MovementsLoading extends MovementsState {}
