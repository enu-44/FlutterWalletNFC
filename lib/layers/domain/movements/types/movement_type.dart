class MovementType {
  final String value;
  const MovementType(this.value);
  static const MovementType sending = MovementType("sending");
  static const MovementType reception = MovementType("reception");
  static const MovementType recharge = MovementType("recharge");
}
