import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/transactions/send_money/send_money.dart';
import 'package:pago_facil_app/layers/layers.dart';

class SendMoneyCubit extends Cubit<SendMoneyState> {
  SendMoneyCubit(this._walletRepository) : super(SendMoneyState.initial());

  final IWalletRepository _walletRepository;

  int tabIndex = 0;
  final formNfcKey = GlobalKey<FormState>();
  final formWalletKey = GlobalKey<FormState>();
  //Controllers
  final walletPhoneCtrl = TextEditingController();
  final walletUserFullNameCtrl = TextEditingController();
  final amountCtrl = TextEditingController();
  final conceptCtrl = TextEditingController();
  final _nfcSerialCtrl = TextEditingController(text: "");
  final _walletIdCtrl = TextEditingController(text: "");

  Future<void> onValidateSupportNfc() async {
    final isAvailable = await NfcUtils.isAvailable();
    if (!isAvailable) return;
    NfcUtils.startSession(onNfc: (String value) {
      if (state is SendMoneyLoading) return;
      _nfcSerialCtrl.text = value;
      onValidateWallet();
    });
  }

  Future<void> onValidateWalletNumber() async {
    emit(SendMoneyState.loading());
    final result = await _walletRepository.infoByPhone(walletPhoneCtrl.text);
    if (result.isLeft()) {
      emit(SendMoneyState.walletPhoneInvalid());
      return;
    }
    result.foldRight(Either<Failure, WalletUserInfo>,
        (WalletUserInfo value, Object? _) {
      walletPhoneCtrl.text = value.phone;
      walletUserFullNameCtrl.text = value.fullName;
      _walletIdCtrl.text = value.walletId;
      emit(SendMoneyState.walletValid());
    });
  }

  Future<void> onValidateWallet() async {
    emit(SendMoneyState.loading());
    final result = await _walletRepository.infoBySerialNfc(_nfcSerialCtrl.text);
    if (result.isLeft()) {
      emit(SendMoneyState.walletNfcInvalid());
      return;
    }
    result.foldRight(Either<Failure, WalletUserInfo>,
        (WalletUserInfo value, Object? _) {
      walletPhoneCtrl.text = value.phone;
      walletUserFullNameCtrl.text = value.fullName;
      _walletIdCtrl.text = value.walletId;
      emit(SendMoneyState.walletValid());
    });
  }

  Future<void> onSendTransaction() async {
    emit(SendMoneyState.loading());
    final result = await _walletRepository.send(SendMoneyRequest(
      amount: double.parse(amountCtrl.text),
      concept: conceptCtrl.text,
      destinationWalletId: _walletIdCtrl.text,
    ));
    result.fold(
      (_) => emit(SendMoneyState.failure()),
      (_) => emit(SendMoneyState.success()),
    );
  }

  bool isValidForm() {
    if (tabIndex == 0) return formNfcKey.currentState!.validate();
    return formWalletKey.currentState!.validate();
  }

  @override
  Future<void> close() {
    NfcUtils.closeNfc();
    walletPhoneCtrl.dispose();
    walletUserFullNameCtrl.dispose();
    amountCtrl.dispose();
    conceptCtrl.dispose();
    _nfcSerialCtrl.dispose();
    return super.close();
  }
}
