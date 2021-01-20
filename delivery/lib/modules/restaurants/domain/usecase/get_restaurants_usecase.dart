
import 'package:delivery/modules/restaurants/domain/entities/restaurant.dart';

abstract class GetRestaurantsUseCase {
  Future<List<Restaurant>> call();
}

class GetRestaurantsUseCaseImpl implements GetRestaurantsUseCase {
  @override
  Future<List<Restaurant>> call() {
    // TODO: implement call
    throw UnimplementedError();
  }


  //Future<List<Restaurant>> call(); //async => gradesListRepository(pageNumber);
}