abstract class HttpResult<T> {
  bool get isSuccess;
}

class HttpResultSuccess<T> extends HttpResult<T> {
  final T? data;

  HttpResultSuccess({this.data});

  factory HttpResultSuccess.withoutData() {
    return HttpResultSuccess<T>();
  }
  @override
  bool get isSuccess => true;
}

class HttpResultFailure<T> extends HttpResult<T> {
  final HttpResultFailureType type;
  final String message;

  HttpResultFailure({required this.type, this.message = ''});

  factory HttpResultFailure.timeout({required String message}) {
    return HttpResultFailure(
        type: HttpResultFailureType.timeout, message: message);
  }

  factory HttpResultFailure.network({required String message}) {
    return HttpResultFailure(
        type: HttpResultFailureType.network, message: message);
  }

  factory HttpResultFailure.unauthorized({required String message}) {
    return HttpResultFailure(
        type: HttpResultFailureType.unauthorized, message: message);
  }

  factory HttpResultFailure.internalServer({required String message}) {
    return HttpResultFailure(
        type: HttpResultFailureType.internalServer, message: message);
  }

  factory HttpResultFailure.serviceUnavailable({required String message}) {
    return HttpResultFailure(
        type: HttpResultFailureType.serviceUnavailable, message: message);
  }

  factory HttpResultFailure.resourceNotFound({required String message}) {
    return HttpResultFailure(
        type: HttpResultFailureType.resourceNotFound, message: message);
  }

  factory HttpResultFailure.unhandledException({required String message}) {
    return HttpResultFailure(
        type: HttpResultFailureType.unhandledException, message: message);
  }

  @override
  bool get isSuccess => false;
}

enum HttpResultFailureType {
  timeout,
  network,
  unauthorized,
  internalServer,
  serviceUnavailable,
  resourceNotFound,
  unhandledException,
}
