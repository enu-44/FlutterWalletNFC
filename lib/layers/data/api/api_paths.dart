class APIPaths {
  const APIPaths._();
  static const baseUrl = 'https://3f74-179-1-128-40.ngrok-free.app';
  // Auth
  static const String verifyPhone = 'api/users/verific-phone/';
  static const String verifyPassword = 'api/auth/login/';
  static const String createAccount = 'api/users/';
  // Movements
  static const String movements = 'api/moviments/';

  // Wallet
  static const String availableBalance = 'api/users/my-balance';
  static const String verifyWalletNfc = 'api/devices_nfc/verific-device-nfc/';
  static const String verifyWalletPhone = 'api/users/verific-wallet-phone/';

  // Transactions
  static const String receiveMoney = 'api/moviments/reception-of-money/';
  static const String sendMoney = 'api/moviments/send-money/';
  static const String rechargeMoney = 'api/moviments/top-up-money/';

  //Devices - Nfc
  static const String devicesNfc = 'api/devices_nfc/';
  static const String enrollNfc = 'api/devices_nfc/';
  static String changeStatusNfc(String nfcId) =>
      'api/devices_nfc/$nfcId/activate-or-inactivate/';
  static String deleteNfc(String nfcId) => 'api/devices_nfc/$nfcId/';
}
