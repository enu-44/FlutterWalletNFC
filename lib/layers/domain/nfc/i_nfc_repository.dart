import 'package:pago_facil_app/layers/common/common.dart';
import 'package:pago_facil_app/layers/domain/domain.dart';

abstract interface class INfcRepository {
  Future<Either<Failure, NoResult>> changeStatus(String nfcId, bool isActive);
  Future<Either<Failure, List<Nfc>>> list();
  Future<Either<Failure, NoResult>> enrollenment(EnrollNfcRequest request);
  Future<Either<Failure, NoResult>> delete(String nfcId);
}
