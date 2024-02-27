class RechargeWalletRequest {
  final String bankName;
  final String bankAccountType;
  final double amount;

  RechargeWalletRequest(
      {required this.bankName,
      required this.bankAccountType,
      required this.amount});
}
