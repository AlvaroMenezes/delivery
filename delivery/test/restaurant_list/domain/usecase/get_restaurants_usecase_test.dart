import 'package:delivery/features/restaurant_list/domain/entities/restaurant.dart';
import 'package:delivery/features/restaurant_list/domain/repositories/get_restaurants_repository.dart';
import 'package:delivery/features/restaurant_list/domain/usecase/get_restaurants_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class GetRestaurantsRepositoryMock extends Mock
    implements GetRestaurantsRepository {}

main() {
  GetRestaurantsRepository? repoMock;
  GetRestaurantsUseCase? getRestaurantsUseCase;
  setUp(() {
    repoMock = GetRestaurantsRepositoryMock();
    getRestaurantsUseCase = GetRestaurantsUseCaseImpl(repoMock!);
  });

  group('Get Restaurants UseCase', () {
    test('Use case should return a list of  Restaurants', () async {
      List<Restaurant> list = [
        Restaurant('', '', '', '', '', '', '', '', '', '')
      ];

      when(repoMock!()).thenAnswer((_) async => list);

      expectLater(await getRestaurantsUseCase!(), list);
      expectLater(await getRestaurantsUseCase!(), isA<List<Restaurant>>());
    });
  });
}
