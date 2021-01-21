import 'package:delivery/base/data_source.dart';
import 'package:delivery/modules/restaurants/data/model/restaurant_model.dart';
import 'package:delivery/modules/restaurants/data/repositories/get_restaurants_repository_impl.dart';
import 'package:delivery/modules/restaurants/domain/repositories/get_restaurants_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class DataSourceMock extends Mock implements DataSource {}

main() {
  DataSourceMock mock;
  GetRestaurantsRepository repository;

  setUp(() async {});

  group('GetRestaurants Repository', () {
    test('call should return list of restaurants model', () async {
      mock = DataSourceMock();

      List<RestaurantModel> list = [];

      when(mock(any)).thenAnswer((_) async => list);

      repository = GetRestaurantsRepositoryImpl(mock);
      var response = await repository();

      expect(response, isA<List<RestaurantModel>>());
    });
  });
}
