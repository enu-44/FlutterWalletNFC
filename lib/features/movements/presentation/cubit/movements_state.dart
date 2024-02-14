abstract class MovementsState {
  MovementsState();
  factory MovementsState.initial() => MovementsInitial();
  factory MovementsState.success(List<dynamic> movements) =>
      MovementsSuccess(movements);
  factory MovementsState.failure() => MovementsFailure();
  factory MovementsState.loading() => MovementsLoading();
}

class MovementsInitial extends MovementsState {}

class MovementsSuccess extends MovementsState {
  final List<dynamic> movements;
  MovementsSuccess(this.movements) : super();
}

class MovementsEmpty extends MovementsState {}

class MovementsFailure extends MovementsState {}

class MovementsLoading extends MovementsState {}
