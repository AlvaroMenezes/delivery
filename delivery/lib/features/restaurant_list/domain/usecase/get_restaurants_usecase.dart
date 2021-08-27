import '../entities/restaurant.dart';
import '../repositories/get_restaurants_repository.dart';

abstract class GetRestaurantsUseCase {
  call();
}

class GetRestaurantsUseCaseImpl implements GetRestaurantsUseCase {
  final GetRestaurantsRepository repository;

  GetRestaurantsUseCaseImpl(this.repository);

  @override
  Future<List<Restaurant>> call() async => await repository();
}
