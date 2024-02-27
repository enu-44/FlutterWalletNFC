import 'package:pago_facil_app/layers/common/common.dart';

typedef T JsonParser<T>(dynamic json);

abstract class IHttpClient {
  Future<HttpResult<T?>> get<T>(String baseUrl, String endpoint,
      {Map<String, String>? headers, JsonParser<T>? jsonParser});
  Future<HttpResult<T?>> post<T>(String baseUrl, String endpoint, dynamic body,
      {Map<String, String>? headers, JsonParser<T> jsonParser});
  Future<HttpResult<T?>> delete<T>(String baseUrl, String endpoint,
      {Map<String, String>? headers, JsonParser<T>? jsonParser});
}
