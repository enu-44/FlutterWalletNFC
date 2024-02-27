import 'package:pago_facil_app/layers/layers.dart';

class SessionRepository implements ISessionRepository {
  final AuthPreference _authPreference;

  SessionRepository(this._authPreference);

  @override
  Future<Either<Failure, Account>> getSignedIn() {
    if (_authPreference.getAccount == null) Left(Failure('Undefined session'));
    return Future.value(Right(_authPreference.getAccount!));
  }

  @override
  Future<bool> isSignedIn() => Future.value(_authPreference.getAccount != null);

  @override
  Future<void> signOut() => _authPreference.logout();
}
