import 'package:delivery/base/data_source.dart';
import 'package:delivery/features/restaurant_list/data/repositories/get_restaurants_repository_impl.dart';
import 'package:delivery/features/restaurant_list/domain/entities/restaurant.dart';
import 'package:delivery/features/restaurant_list/domain/repositories/get_restaurants_repository.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class DataSourceMock extends Mock implements DataSource {}

main() {
  GetRestaurantsRepository? getRestaurantsRepository;
  DataSource? dataSourceMock;
  setUp(() {
    dataSourceMock = DataSourceMock();
    getRestaurantsRepository = GetRestaurantsRepositoryImpl(dataSourceMock!);
  });

  group('Get Restaurants Repository', () {
    test('Use case should return a list of  Restaurants', () async {
      List<Restaurant> list = [
        Restaurant('', '', '', '', '', '', '', '', '', '')
      ];

      when(dataSourceMock!(any)).thenAnswer(((_) async => list));

      expectLater(await getRestaurantsRepository!(), list);
      expectLater(await getRestaurantsRepository!(), isA<List<Restaurant>>());
    });
  });
}
