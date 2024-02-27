import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:pago_facil_app/layers/common/common.dart';

class JwtManager {
  const JwtManager._();

  static JwtModel decoderJwt(String token) {
    try {
      final Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      return JwtModel.fromJson(decodedToken);
    } catch (e) {
      throw JwtException(e.toString(), e);
    }
  }
}
