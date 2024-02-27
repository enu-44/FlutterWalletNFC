import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/features/wallet_balance/wallet_balance.dart';
import 'package:pago_facil_app/layers/layers.dart';

class AvailableBalanceCubit extends Cubit<AvailableBalanceState> {
  AvailableBalanceCubit(this._walletRepository)
      : super(AvailableBalanceState.initial());
  final IWalletRepository _walletRepository;
  Future<void> load() async {
    final result = await _walletRepository.balanceInfo();
    result.fold(
      (_) => emit(AvailableBalanceState.failure()),
      (_) => emit(AvailableBalanceState.success(_.availableBalance)),
    );
  }
}
