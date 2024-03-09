import 'package:pago_facil_app/layers/common/common.dart';
import 'package:pago_facil_app/layers/domain/domain.dart';

abstract interface class IAuthRepository {
  Future<Either<Failure, NoResult>> checkPhone(String phone);
  Future<Either<Failure, Account>> checkPassword(String phone, String password);
  Future<Either<Failure, Account>> createAccount(CreateAccountRequest request);
}