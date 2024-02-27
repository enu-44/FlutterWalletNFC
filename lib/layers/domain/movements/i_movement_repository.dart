import 'package:pago_facil_app/layers/common/common.dart';
import 'package:pago_facil_app/layers/domain/domain.dart';

abstract interface class IMovementRepository {
  Future<Either<Failure, List<Movement>>> list();
}
