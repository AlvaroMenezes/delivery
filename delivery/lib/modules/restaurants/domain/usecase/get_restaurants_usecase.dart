import 'package:delivery/modules/restaurants/domain/entities/restaurant.dart';
import 'package:delivery/modules/restaurants/domain/repositories/get_restaurants_repositories.dart';

abstract class GetRestaurantsUseCase {
  Future<List<Restaurant>> call();
}

class GetRestaurantsUseCaseImpl implements GetRestaurantsUseCase {
  final GetRestaurantsRepository repository;

  GetRestaurantsUseCaseImpl(this.repository);

  @override
  Future<List<Restaurant>> call() async => repository();
}
