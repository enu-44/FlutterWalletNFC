import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/transactions/transactions.dart';
import 'package:pago_facil_app/layers/layers.dart';

class ReceiveMoneyCubit extends Cubit<ReceivedMoneyState> {
  ReceiveMoneyCubit(this._walletRepository)
      : super(ReceivedMoneyState.initial());

  final IWalletRepository _walletRepository;

  final formReceiveAmountKey = GlobalKey<FormState>();
  final formReceiveNfcKey = GlobalKey<FormState>();
  final phoneCtrl = TextEditingController();
  final fullNameCtrl = TextEditingController();
  final amountCtrl = TextEditingController();
  final conceptCtrl = TextEditingController();
  final _nfcSerialCtrl = TextEditingController(text: "");
  final _walletIdCtrl = TextEditingController(text: "");

  Future<void> onValidateSupportNfc() async {
    final isAvailable = await NfcUtils.isAvailable();
    if (!isAvailable) return;
    NfcUtils.startSession(onNfc: (String value) {
      if (state is ReceivedMoneyLoading) return;
      _nfcSerialCtrl.text = value;
      onValidateWallet();
    });
  }

  Future<void> onValidateWallet() async {
    emit(ReceivedMoneyState.loading());
    final result = await _walletRepository.infoBySerialNfc(_nfcSerialCtrl.text);
    if (result.isLeft()) {
      emit(ReceivedMoneyState.walletInvalid());
      return;
    }
    result.foldRight(Either<Failure, WalletUserInfo>,
        (WalletUserInfo value, Object? _) {
      phoneCtrl.text = value.phone;
      fullNameCtrl.text = value.fullName;
      _walletIdCtrl.text = value.walletId;
      emit(ReceivedMoneyState.walletValid());
    });
  }

  Future<void> onSendTransaction() async {
    emit(ReceivedMoneyState.loading());
    final result = await _walletRepository.receive(ReceiveMoneyRequest(
        amount: double.parse(amountCtrl.text),
        billingWalletId: _walletIdCtrl.text,
        concept: conceptCtrl.text));
    result.fold(
      (_) => emit(ReceivedMoneyState.failure()),
      (_) => emit(ReceivedMoneyState.success()),
    );
  }

  void goReadToNfc() => emit(ReceivedMoneyState.toReadNfc());
  void emitState(ReceivedMoneyState _) => emit(_);
  bool isLoading(ReceivedMoneyState state) => state is ReceivedMoneyLoading;

  @override
  Future<void> close() {
    NfcUtils.closeNfc();
    phoneCtrl.dispose();
    fullNameCtrl.dispose();
    amountCtrl.dispose();
    conceptCtrl.dispose();
    _nfcSerialCtrl.dispose();
    _walletIdCtrl.dispose();
    return super.close();
  }
}
