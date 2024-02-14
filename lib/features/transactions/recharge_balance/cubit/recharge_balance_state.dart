abstract class RechargeBalanceState {
  RechargeBalanceState();
  factory RechargeBalanceState.initial() => _RechargeBalanceInitial();
  factory RechargeBalanceState.loading() => RechargeBalanceLoading();
  factory RechargeBalanceState.success() => RechargeBalanceSuccess();
  factory RechargeBalanceState.failure() => RechargeBalanceFailure();
}

class _RechargeBalanceInitial extends RechargeBalanceState {}

class RechargeBalanceLoading extends RechargeBalanceState {}

class RechargeBalanceSuccess extends RechargeBalanceState {}

class RechargeBalanceFailure extends RechargeBalanceState {}
