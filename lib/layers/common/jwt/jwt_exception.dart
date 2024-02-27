class JwtException implements Exception {
  JwtException(this.message, this.exception);
  final String message;
  final dynamic exception;
}
