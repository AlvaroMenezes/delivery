class GetRestaurantsDataSourceException implements Exception {
  String statusCode;
  String cause;
  GetRestaurantsDataSourceException(this.statusCode,this.cause);

  String toString() => 'GetRestaurantsDataSourceException[$statusCode]: $cause';
}
