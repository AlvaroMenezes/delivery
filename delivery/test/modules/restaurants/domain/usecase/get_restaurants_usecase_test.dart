
import 'package:delivery/modules/restaurants/domain/entities/restaurant.dart';
import 'package:delivery/modules/restaurants/domain/usecase/get_restaurants_usecase.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  GetRestaurantsUseCase useCase;


  setUp(() async {

    useCase = GetRestaurantsUseCaseImpl();
  });

  group('Get Restaurants Use Case', () {

    test('Must return list of restaurants ', () async {

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