import 'package:pago_facil_app/layers/layers.dart';

class AuthRepository implements IAuthRepository {
  AuthRepository(this._http, this._authPreference);
  final IHttpClient _http;
  final AuthPreference _authPreference;
  static const baseUrl = APIPaths.baseUrl;

  @override
  Future<Either<Failure, Account>> checkPassword(
      String phone, String password) async {
    final body = LoginRequestDto(phone: phone, password: password).toJson();
    final result = await _http.post<LoginResponseDto>(
        baseUrl, APIPaths.verifyPassword, body,
        jsonParser: (_) => LoginResponseDto.fromJson(_));
    if (!result.isSuccess) return _failure(result);
    final account = _getAccount(result.success().data!.access);
    await _authPreference.setAccount(account);
    return Right(account);
  }

  @override
  Future<Either<Failure, NoResult>> checkPhone(String phone) async {
    final body = VerifyPhoneRequestDto(phone).toJson();
    final result = await _http.post(baseUrl, APIPaths.verifyPhone, body);
    if (!result.isSuccess) return _failure(result);
    return Right(NoResult());
  }

  @override
  Future<Either<Failure, Account>> createAccount(
      CreateAccountRequest request) async {
    final resultCreate =
        await _http.post(baseUrl, APIPaths.createAccount, request.toDto());
    if (!resultCreate.isSuccess) return _failure(resultCreate);
    return checkPassword(request.phoneNumber, request.password);
  }

  Left<Failure, T> _failure<T>(HttpResult result) =>
      Left<Failure, T>(Failure(result.failure().message));

  Account _getAccount(String token) {
    final dataToken = JwtManager.decoderJwt(token);
    return Account(
        fullName: dataToken.userName ?? '',
        uid: dataToken.userId ?? '',
        token: token);
  }
}
