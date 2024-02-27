import 'package:pago_facil_app/layers/layers.dart';

class MovementRepository implements IMovementRepository {
  MovementRepository(this._http);
  final IHttpClient _http;

  static const baseUrl = APIPaths.baseUrl;

  @override
  Future<Either<Failure, List<Movement>>> list() async {
    final result = await _http.get<List<MovementResponseDto>>(
        baseUrl, APIPaths.movements,
        jsonParser: (json) => MovementResponseDto.fromListJson(json));
    if (!result.isSuccess) return _failure(result);
    final data = result.success().data ?? [];
    return Right(data.map((e) => e.toDom()).toList());
  }

  Left<Failure, T> _failure<T>(HttpResult result) =>
      Left<Failure, T>(Failure(result.failure().message));
}
