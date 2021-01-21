import 'dart:convert';

import 'package:delivery/modules/restaurants/data/datasource/exceptions/get_restaurants_datasource_exception.dart';
import 'package:delivery/modules/restaurants/data/datasource/get_restaurants_data_source.dart';
import 'package:delivery/modules/restaurants/data/model/restaurant_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class HttpClientAdapterMock extends Mock implements HttpClientAdapter {}

main() {
  GetRestaurantsDataSource dataSource;
  HttpClientAdapterMock adapterMock;
  var response;
  setUp(() async {
    adapterMock = HttpClientAdapterMock();
    Dio dio = Dio();
    dio.httpClientAdapter = adapterMock;
    dataSource = GetRestaurantsDataSource(dio);

    response =
    {"data":[
      {
        "name": "A",
        "logo": "B",
        "score": "C",
        "colorScore": "D",
        "delivery": "E",
        "cousine": "F",
        "photoPlate": "G",
        "plateName": "H",
        "description": "I",
        "price": "J",
      },   {
        "name": "A",
        "logo": "B",
        "score": "C",
        "colorScore": "D",
        "delivery": "E",
        "cousine": "F",
        "photoPlate": "G",
        "plateName": "H",
        "description": "I",
        "price": "J",
      }
    ]};
  });

  group('GetRestaurantsDataSource', () {
    test('call should fail and throw GetRestaurantsDataSourceException ',
        () async {
      final httpResponse = ResponseBody.fromString(
        json.encode(response),
        500,
      );

      when(adapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      expect(
          () async => dataSource(
              (json) => RestaurantModel.fromJson(json)),
          throwsA(isA<GetRestaurantsDataSourceException>()));
    });

    test('call should return 200  ', () async {
      final httpResponse = ResponseBody.fromString(
        json.encode(response),
        200,
      );

      when(adapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      var model = await dataSource(
          (json) => RestaurantModel.fromJson(json));

      expect(model, isA<List<RestaurantModel>>());
    });
  });
}
