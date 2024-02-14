class MovementType {
  final String value;
  const MovementType(this.value);
  static const MovementType envio = MovementType("Envio");
  static const MovementType recepcion = MovementType("Recepcion");
  static const MovementType recarga = MovementType("Recarga");
}
