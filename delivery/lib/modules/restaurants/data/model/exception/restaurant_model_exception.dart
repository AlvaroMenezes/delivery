class RestaurantModelParseException implements Exception {
  String cause;
  RestaurantModelParseException(this.cause);

  String toString() => 'RestauranteModelParseException: $cause';
}
