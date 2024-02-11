abstract class HomeState {
  HomeState();
  factory HomeState.initial() => _HomeInitial();
}

class _HomeInitial extends HomeState {}
