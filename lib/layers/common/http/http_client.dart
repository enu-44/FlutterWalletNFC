import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:pago_facil_app/layers/common/common.dart';
import 'package:http/http.dart' as http;

class HttpClient implements IHttpClient {
  HttpClient(this._defaultHeaders);
  final IDefaultHeaders _defaultHeaders;

  @override
  Future<HttpResult<T?>> get<T>(String baseUrl, String endpoint,
      {Map<String, String>? headers, JsonParser<T>? jsonParser}) async {
    final response = http.get(Uri.parse('$baseUrl/$endpoint'),
        headers: _mergeHeaders(headers));
    return performHttpRequest(response, jsonParser);
  }

  @override
  Future<HttpResult<T?>> post<T>(String baseUrl, String endpoint, dynamic body,
      {Map<String, String>? headers, JsonParser<T>? jsonParser}) async {
    final request = http.post(Uri.parse('$baseUrl/$endpoint'),
        body: jsonEncode(body), headers: _mergeHeaders(headers));
    return performHttpRequest(request, jsonParser);
  }

  @override
  Future<HttpResult<T?>> delete<T>(String baseUrl, String endpoint,
      {Map<String, String>? headers, JsonParser<T>? jsonParser}) async {
    final request = http.delete(Uri.parse('$baseUrl/$endpoint'),
        headers: _mergeHeaders(headers));
    return performHttpRequest(request, jsonParser);
  }

  Map<String, String> _mergeHeaders(Map<String, String>? headers) {
    final defaultHeaders = _defaultHeaders.getDefaultHeaders();
    final allHeaders =
        headers != null ? {...defaultHeaders, ...headers} : defaultHeaders;
    return allHeaders;
  }

  Future<HttpResult<T>> performHttpRequest<T>(
      Future<http.Response> response, JsonParser<T>? jsonParser) async {
    try {
      final result = await response;
      return _processResponse(result, jsonParser);
    } on TimeoutException catch (e) {
      return Future.value(HttpResultFailure.timeout(message: e.message ?? ''));
    } on SocketException catch (e) {
      return Future.value(HttpResultFailure.network(message: e.message));
    } catch (_) {
      return Future.value(
          HttpResultFailure.unhandledException(message: _.toString()));
    }
  }

  HttpResult<T> _processResponse<T>(
      http.Response response, JsonParser<T>? jsonParser) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return _processBoddy(response, jsonParser);
    } else if (response.statusCode == 404) {
      return HttpResultFailure.resourceNotFound(
          message: response.reasonPhrase ?? 'Resource not found');
    } else if (response.statusCode == 401) {
      return HttpResultFailure.unauthorized(
          message: response.reasonPhrase ?? 'Unauthorized');
    } else if (response.statusCode == 500) {
      return HttpResultFailure.internalServer(
          message: response.reasonPhrase ?? 'Internal server error');
    } else if (response.statusCode == 503) {
      return HttpResultFailure.serviceUnavailable(
          message: response.reasonPhrase ?? 'Service unavailable');
    } else {
      return HttpResultFailure.unhandledException(
          message: response.reasonPhrase ?? 'Unhandled exception');
    }
  }

  HttpResult<T> _processBoddy<T>(
      http.Response response, JsonParser<T>? jsonParser) {
    if (T == String || T.toString() == 'String?') {
      return HttpResultSuccess<T>(data: utf8.decode(response.bodyBytes) as T);
    } else if (T == double || T.toString() == 'double?') {
      return HttpResultSuccess<T>(data: double.parse(response.body) as T);
    } else if (T == int || T.toString() == 'int?') {
      return HttpResultSuccess<T>(data: int.parse(response.body) as T);
    } else {
      if (jsonParser != null) {
        return HttpResultSuccess<T>(
            data: jsonParser(jsonDecode(utf8.decode(response.bodyBytes))));
      }
      return HttpResultSuccess<T>.withoutData();
    }
  }
}
