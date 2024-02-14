abstract class HomeState {
  HomeState();
  factory HomeState.initial() => _HomeInitial();
  factory HomeState.success(String fullName) => HomeSuccess(fullName);
}

class _HomeInitial extends HomeState {}

class HomeSuccess extends HomeState {
  final String fullName;
  HomeSuccess(this.fullName);
}
