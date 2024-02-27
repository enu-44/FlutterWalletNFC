import 'package:pago_facil_app/layers/layers.dart';

class WalletRepository implements IWalletRepository {
  WalletRepository(this._http);

  final IHttpClient _http;
  static const baseUrl = APIPaths.baseUrl;

  @override
  Future<Either<Failure, WalletInfo>> balanceInfo() async {
    final result = await _http.get<double>(baseUrl, APIPaths.availableBalance);
    if (!result.isSuccess) return _failure(result);
    final info = WalletInfo(availableBalance: result.success().data ?? 0.0);
    return Right(info);
  }

  @override
  Future<Either<Failure, WalletUserInfo>> infoBySerialNfc(String serial) =>
      _infoWallet(
          APIPaths.verifyWalletNfc, VerifySerialNfcRequestDto(serial).toJson());

  @override
  Future<Either<Failure, WalletUserInfo>> infoByPhone(String phone) =>
      _infoWallet(
          APIPaths.verifyWalletPhone, VerifyPhoneRequestDto(phone).toJson());

  Future<Either<Failure, WalletUserInfo>> _infoWallet(
      String api, Map<String, dynamic> body) async {
    final result = await _http.post<WalletValidationResponseDto>(
      baseUrl,
      api,
      body,
      jsonParser: (_) => WalletValidationResponseDto.fromJson(_),
    );
    if (!result.isSuccess) return _failure(result);
    final data = result.success().data!.toDom();
    return Right(data);
  }

  @override
  Future<Either<Failure, NoResult>> receive(ReceiveMoneyRequest request) async {
    final result =
        await _http.post(baseUrl, APIPaths.receiveMoney, request.toDto());
    if (!result.isSuccess) return _failure(result);
    return Right(NoResult());
  }

  @override
  Future<Either<Failure, NoResult>> recharge(
      RechargeWalletRequest request) async {
    final result =
        await _http.post(baseUrl, APIPaths.rechargeMoney, request.toDto());
    if (!result.isSuccess) return _failure(result);
    return Right(NoResult());
  }

  @override
  Future<Either<Failure, NoResult>> send(SendMoneyRequest request) async {
    final result =
        await _http.post(baseUrl, APIPaths.sendMoney, request.toDto());
    if (!result.isSuccess) return _failure(result);
    return Right(NoResult());
  }

  Left<Failure, T> _failure<T>(HttpResult result) =>
      Left<Failure, T>(Failure(result.failure().message));
}
