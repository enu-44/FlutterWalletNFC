import 'package:pago_facil_app/layers/layers.dart';

extension SendMoneyMapper on SendMoneyRequest {
  SendMoneyRequestDto toDto() => SendMoneyRequestDto(
      destinationWalletId: destinationWalletId,
      amount: amount,
      concept: concept);
}

extension ReceiveMoneyMapper on ReceiveMoneyRequest {
  ReceiveMoneyRequestDto toDto() => ReceiveMoneyRequestDto(
      billingWalletId: billingWalletId, amount: amount, concept: concept);
}

extension RechargeWalletMapper on RechargeWalletRequest {
  RechargeWalletRequestDto toDto() => RechargeWalletRequestDto(
      bankAccountType: bankAccountType, banckName: bankName, amount: amount);
}

extension WalletValidationMapper on WalletValidationResponseDto {
  WalletUserInfo toDom() =>
      WalletUserInfo(fullName: user, phone: phone, walletId: walletId);
}
