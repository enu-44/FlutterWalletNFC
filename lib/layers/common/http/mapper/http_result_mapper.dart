import 'package:pago_facil_app/layers/common/common.dart';

extension HttpResultMapper<T> on HttpResult<T> {
  HttpResultSuccess<T> success() => this as HttpResultSuccess<T>;
  HttpResultFailure<T> failure() => this as HttpResultFailure<T>;
}
