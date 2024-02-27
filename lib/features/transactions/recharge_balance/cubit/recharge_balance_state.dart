abstract class RechargeBalanceState {
  RechargeBalanceState({this.message = ''});
  final String message;
  factory RechargeBalanceState.initial() => _RechargeBalanceInitial();
  factory RechargeBalanceState.loading() => RechargeBalanceLoading();
  factory RechargeBalanceState.success() => RechargeBalanceSuccess();
  factory RechargeBalanceState.failure() => RechargeBalanceFailure();
}

class _RechargeBalanceInitial extends RechargeBalanceState {}

class RechargeBalanceLoading extends RechargeBalanceState {
  RechargeBalanceLoading({super.message = "Cargando..."});
}

class RechargeBalanceSuccess extends RechargeBalanceState {
  RechargeBalanceSuccess(
      {super.message = "Se realizó la recarga correctamente"});
}

class RechargeBalanceFailure extends RechargeBalanceState {
  RechargeBalanceFailure(
      {super.message =
          "Ocurrio un error en la transacción, reintente de nuevo"});
}
