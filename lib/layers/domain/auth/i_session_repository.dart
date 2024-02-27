import 'package:pago_facil_app/layers/layers.dart';

abstract interface class ISessionRepository {
  Future<Either<Failure, Account>> getSignedIn();
  Future<bool> isSignedIn();
  Future<void> signOut();
}
