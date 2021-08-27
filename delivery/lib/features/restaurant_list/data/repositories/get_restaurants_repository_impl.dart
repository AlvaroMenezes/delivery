import 'package:delivery/base/data_source.dart';
import 'package:delivery/features/restaurant_list/data/model/restaurant_model.dart';
import 'package:delivery/features/restaurant_list/domain/entities/restaurant.dart';
import 'package:delivery/features/restaurant_list/domain/repositories/get_restaurants_repository.dart';

class GetRestaurantsRepositoryImpl implements GetRestaurantsRepository {
  final DataSource _dataSource;

  GetRestaurantsRepositoryImpl(this._dataSource);

  @override
  Future<List<Restaurant>> call() async {
    return await _dataSource((json) => RestaurantModel.fromJson(json));
  }
}
