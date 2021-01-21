import 'package:delivery/modules/restaurants/data/datasource/get_restaurants_data_source.dart';
import 'package:delivery/modules/restaurants/data/repositories/get_restaurants_repository_impl.dart';
import 'package:delivery/modules/restaurants/domain/repositories/get_restaurants_repository.dart';
import 'package:delivery/modules/restaurants/domain/usecase/get_restaurants_usecase.dart';
import 'package:delivery/modules/restaurants/presenter/bloc/restaurants_list_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt _l = GetIt.instance;

void setupDependenceInjection() {
  setup();
  setupRestaurants();
}

void setup() async {
  _l.registerFactory<Dio>(() => Dio());
}

void setupRestaurants() async {
  _l.registerFactory<GetRestaurantsDataSource>(
      () => GetRestaurantsDataSource(_l<Dio>()));

  _l.registerFactory<GetRestaurantsRepository>(
      () => GetRestaurantsRepositoryImpl(_l<GetRestaurantsDataSource>()));

  _l.registerFactory<GetRestaurantsUseCase>(
      () => GetRestaurantsUseCaseImpl(_l<GetRestaurantsRepository>()));

  _l.registerFactory<RestaurantsListBloc>(
      () => RestaurantsListBloc(_l<GetRestaurantsUseCase>()));
}
