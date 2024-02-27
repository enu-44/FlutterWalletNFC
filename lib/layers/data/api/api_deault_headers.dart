import 'package:pago_facil_app/layers/layers.dart';

class ApiDefaultHeaders implements IDefaultHeaders {
  ApiDefaultHeaders(this._authPreference);
  final AuthPreference _authPreference;
  @override
  Map<String, String> getDefaultHeaders() {
    final Map<String, String> headers = {
      'Content-type': 'application/json',
    };
    if (_authPreference.getAccount != null) {
      headers['Authorization'] = 'Bearer ${_authPreference.getAccount?.token}';
    }
    return headers;
  }
}
