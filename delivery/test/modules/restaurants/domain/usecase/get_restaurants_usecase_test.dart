import 'package:delivery/modules/restaurants/domain/entities/restaurant.dart';
import 'package:delivery/modules/restaurants/domain/repositories/get_restaurants_repository.dart';
import 'package:delivery/modules/restaurants/domain/usecase/get_restaurants_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class RepositoryMock extends Mock implements GetRestaurantsRepository {}

main() {
  GetRestaurantsUseCase useCase;
  GetRestaurantsRepository repository;

  setUp(() async {
    repository = RepositoryMock();
    useCase = GetRestaurantsUseCaseImpl(repository);
  });

  group('Get Restaurants Use Case', () {
    test('Must return list of restaurants ', () async {
      List<Restaurant> restaurants = [];
      restaurants.add(Restaurant("", "", "", "", "", "", "", "", "", ""));

      when(repository()).thenAnswer((_) async => restaurants);

      var response = await useCase();
      expect(response, isA<List<Restaurant>>());
    });

/*
    test('Must return Exception ', () async {

      expect(() async =>   await useCase(),
          throwsA(isInstanceOf<NetworkConnectionException>()));

    });
    *
 */
  });
}
