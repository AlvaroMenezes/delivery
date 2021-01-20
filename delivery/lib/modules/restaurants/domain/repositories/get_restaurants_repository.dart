import 'package:delivery/modules/restaurants/domain/entities/restaurant.dart';

abstract class GetRestaurantsRepository {
  Future<List<Restaurant>> call();
}
