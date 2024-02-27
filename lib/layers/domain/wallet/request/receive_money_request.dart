class ReceiveMoneyRequest {
  final String concept;
  final double amount;
  final String billingWalletId; //Billetera donde se ejecuta el cobro

  ReceiveMoneyRequest(
      {required this.concept,
      required this.billingWalletId,
      required this.amount});
}
