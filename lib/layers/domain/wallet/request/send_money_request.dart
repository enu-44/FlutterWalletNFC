class SendMoneyRequest {
  final String concept;
  final double amount;
  final String destinationWalletId;

  SendMoneyRequest(
      {required this.concept,
      required this.destinationWalletId,
      required this.amount});
}
