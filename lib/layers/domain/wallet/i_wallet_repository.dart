import 'package:pago_facil_app/layers/common/common.dart';
import 'package:pago_facil_app/layers/domain/domain.dart';
import 'package:pago_facil_app/layers/domain/wallet/wallet.dart';

abstract interface class IWalletRepository {
  Future<Either<Failure, WalletInfo>> balanceInfo();
  Future<Either<Failure, NoResult>> recharge(RechargeWalletRequest request);
  Future<Either<Failure, NoResult>> receive(ReceiveMoneyRequest request);
  Future<Either<Failure, NoResult>> send(SendMoneyRequest request);
  Future<Either<Failure, WalletUserInfo>> infoBySerialNfc(String serial);
  Future<Either<Failure, WalletUserInfo>> infoByPhone(String phone);
}
