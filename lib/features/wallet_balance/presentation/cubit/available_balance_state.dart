abstract class AvailableBalanceState {
  AvailableBalanceState();
  factory AvailableBalanceState.initial() => _AvailableBalanceInitial();
  factory AvailableBalanceState.success(double availableBalance) =>
      AvailableBalanceSuccess(availableBalance);
  factory AvailableBalanceState.failure() => AvailableBalanceFailure();
}

class _AvailableBalanceInitial extends AvailableBalanceState {}

class AvailableBalanceSuccess extends AvailableBalanceState {
  final double availableBalance;
  AvailableBalanceSuccess(this.availableBalance) : super();
}

class AvailableBalanceFailure extends AvailableBalanceState {}
