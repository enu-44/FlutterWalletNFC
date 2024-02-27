import 'package:pago_facil_app/layers/layers.dart';

class NfcRepository implements INfcRepository {
  NfcRepository(this._http);
  final IHttpClient _http;

  static const baseUrl = APIPaths.baseUrl;

  @override
  Future<Either<Failure, NoResult>> enrollenment(
      EnrollNfcRequest request) async {
    final body = request.toDto().toJson();
    final result = await _http.post(baseUrl, APIPaths.enrollNfc, body);
    if (!result.isSuccess) return _failure(result);
    return Right(NoResult());
  }

  @override
  Future<Either<Failure, List<Nfc>>> list() async {
    final result = await _http.get<List<NfcResponseDto>>(
        baseUrl, APIPaths.devicesNfc,
        jsonParser: (json) => NfcResponseDto.fromListJson(json));
    if (!result.isSuccess) return _failure(result);
    final data = result.success().data ?? [];
    return Right(data.map((e) => e.toDom()).toList());
  }

  @override
  Future<Either<Failure, NoResult>> changeStatus(
      String nfcId, bool isActive) async {
    final body = NfcStatusRequestDto(isActive: isActive).toJson();
    final result =
        await _http.post(baseUrl, APIPaths.changeStatusNfc(nfcId), body);
    if (!result.isSuccess) return _failure(result);
    return Right(NoResult());
  }

  @override
  Future<Either<Failure, NoResult>> delete(String nfcId) async {
    final result = await _http.delete(baseUrl, APIPaths.deleteNfc(nfcId));
    if (!result.isSuccess) return _failure(result);
    return Right(NoResult());
  }

  Left<Failure, T> _failure<T>(HttpResult result) =>
      Left<Failure, T>(Failure(result.failure().message));
}
